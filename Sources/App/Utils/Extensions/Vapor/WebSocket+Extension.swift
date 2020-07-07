//
//  File.swift
//  
//
//  Created by Mediym on 6/20/20.
//

import Vapor

extension WebSocket {
    
    @discardableResult
    func exceptionClose<T: Encodable>(error: T, use encoder: JSONEncoder = .init()) -> EventLoopFuture<Void> {
        
        guard let data = try? encoder.encode(error) else {
            print("Failed to decode exception close error")
            return eventLoop.future()
        }
    
        let promise = eventLoop.makePromise(of: Void.self)
        send(data.bytes, promise: promise)
        
        return promise.futureResult.flatMap { _ in
            print("SENDED")
            return self.close().always { result in
                print(result)
            }
        }
    }
    
    func send<T: Encodable>(object: T, encoder: JSONEncoder = JSONEncoder()) -> EventLoopFuture<Void> {
        guard let data = try? encoder.encode(object) else {
            return eventLoop.future()
        }
        
        return send(data: data)
    }
    
    func send(data: Data) -> EventLoopFuture<Void> {
        let promise = eventLoop.makePromise(of: Void.self)
        self.send(data.bytes, promise: promise)
        
        return promise.futureResult
    }
    
    func send<T>(text: T) -> EventLoopFuture<Void> where T: Collection, T.Element == Character {
        let promise = eventLoop.makePromise(of: Void.self)
        send(text, promise: promise)
        
        return promise.futureResult
    }
    
}
