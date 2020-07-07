//
//  EventLoopGroupStorage.swift
//  
//
//  Created by Mediym on 7/2/20.
//

import NIO

public class EventLoopGroupStorage {
    
    static var eventLoopGroup: EventLoopGroup!
    static var eventLoopCount: Int!

    static var eventLoops: [EventLoop] {
        return (0 ..< eventLoopCount).map { _ in eventLoopGroup.next() }
    }
    
    public static func set(eventLoopGroup: EventLoopGroup, eventLoopCount: Int) {
        self.eventLoopGroup = eventLoopGroup
        self.eventLoopCount = eventLoopCount
    }
    
}
