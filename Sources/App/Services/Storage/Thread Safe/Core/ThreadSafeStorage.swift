//
//  ThreadSafeStorage.swift
//  
//
//  Created by Mediym on 6/26/20.
//

import NIO

protocol ThreadSafeStorage: class {
    
    var eventLoops: [EventLoop] { get set }
    
}

extension ThreadSafeStorage {
 
    // MARK: - Event Loop
    
    func set(eventLoopGroup: EventLoopGroup, eventLoopCount: Int) {
        self.eventLoops = (0 ..< eventLoopCount).map { _ in eventLoopGroup.next() }
    }
    
    func getEventLoop<Value>(key: KeyPath<Self, Value>) -> EventLoop {
        return eventLoops[Int(key.hashValue.magnitude % UInt(eventLoops.count))]
    }
    
    // Thread Unsafe
    
    func unsafeHasValue<Value>(keyPath: KeyPath<Self, Optional<Value>>) -> Bool {
        return self[keyPath: keyPath].isNotNil
    }
    
    func unsafeGetValue<Value>(keyPath: KeyPath<Self, Value>) -> Value {
        return self[keyPath: keyPath]
    }
    
    func unsafeGetValue<KeyValue, Value>(keyPath: KeyPath<Self, KeyValue>, subKeyValue: KeyPath<KeyValue, Value>) -> Value {
        return self[keyPath: keyPath][keyPath: subKeyValue]
    }
    
    func unsafeSetValue<Value>(keyPath: ReferenceWritableKeyPath<Self, Value>, value: Value) {
        self[keyPath: keyPath] = value
    }
    
    func unsafeSetValue<KeyValue, Value>(keyPath: ReferenceWritableKeyPath<Self, KeyValue>, subKeyValue: ReferenceWritableKeyPath<KeyValue, Value>, value: Value) {
        self[keyPath: keyPath][keyPath: subKeyValue] = value
    }
    
    // Thread Safe
        
    func safeHasValue<Value>(keyPath: KeyPath<Self, Optional<Value>>, on eventLoop: EventLoop) -> EventLoopFuture<Bool> {
        return self
            .getEventLoop(key: keyPath)
            .makeSucceededFuture(())
            .map { self.unsafeHasValue(keyPath: keyPath) }
            .hop(to: eventLoop)
    }
    
    func safeGetValue<Value>(keyPath: KeyPath<Self, Value>, on eventLoop: EventLoop) -> EventLoopFuture<Value> {
        return self
            .getEventLoop(key: keyPath)
            .makeSucceededFuture(())
            .map { self.unsafeGetValue(keyPath: keyPath) }
            .hop(to: eventLoop)
    }
    
    func safeGetValue<KeyValue, Value>(keyPath: KeyPath<Self, KeyValue>, subKeyPath: KeyPath<KeyValue, Value>, on eventLoop: EventLoop) -> EventLoopFuture<Value> {
        return self
            .getEventLoop(key: keyPath)
            .makeSucceededFuture(())
            .map { self.unsafeGetValue(keyPath: keyPath, subKeyValue: subKeyPath) }
            .hop(to: eventLoop)
    }
    
    func safeSetValue<Value>(keyPath: ReferenceWritableKeyPath<Self, Value>, value: Value, on eventLoop: EventLoop) -> EventLoopFuture<Void> {
        return self
            .getEventLoop(key: keyPath)
            .makeSucceededFuture(())
            .map { self.unsafeSetValue(keyPath: keyPath, value: value) }
            .hop(to: eventLoop)
    }
    
    func safeSetValue<KeyValue, Value>(keyPath: ReferenceWritableKeyPath<Self, KeyValue>, subKeyPath: ReferenceWritableKeyPath<KeyValue, Value>, value: Value, on eventLoop: EventLoop) -> EventLoopFuture<Void> {
        return self
            .getEventLoop(key: keyPath)
            .makeSucceededFuture(())
            .map { self.unsafeSetValue(keyPath: keyPath, subKeyValue: subKeyPath, value: value) }
            .hop(to: eventLoop)
    }
    
    func safeUpdateValue<Value>(keyPath: ReferenceWritableKeyPath<Self, Value>, on eventLoop: EventLoop, action: @escaping (Value) -> Value) -> EventLoopFuture<Void> {
        
        return self
            .getEventLoop(key: keyPath)
            .makeSucceededFuture(())
            .map {
                let newValue = action(self.unsafeGetValue(keyPath: keyPath))
                self.unsafeSetValue(keyPath: keyPath, value: newValue)
            }
            .hop(to: eventLoop)   
    }
    
    func safeMapAction<Value, MappedValue>(keyPath: ReferenceWritableKeyPath<Self, Value>, on eventLoop: EventLoop, action: @escaping (Value) -> MappedValue) -> EventLoopFuture<MappedValue> {
        
        return self
            .getEventLoop(key: keyPath)
            .makeSucceededFuture(())
            .map {
                return action(self.unsafeGetValue(keyPath: keyPath))
            }
            .hop(to: eventLoop)
    }
    

            
}
    
