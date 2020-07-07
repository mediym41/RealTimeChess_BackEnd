//
//  SessionRouter.swift
//  
//
//  Created by Mediym on 6/19/20.
//

import Vapor

struct SessionRouter: RouteCollection {
    
    let controller = SessionController()
    
    func boot(routes: RoutesBuilder) throws {
        
//        routes.get("gogogo", use: { req -> EventLoopFuture<Int> in
//            
//            var value = 0
//            
//            return ChessRoomsStorage.shared.safeUpdateValue(keyPath: \.integer, on: req.eventLoop, action: { val in
//                value = val + 1
//                return val + 1
//            }).map {
//                return value
//            }
//        })
        
        let group = routes.grouped("auth")
        
        group.post("register", use: controller.register)
        group.post("rename", use: controller.rename)
//        routes.get("blog", use: self.controller.blogView)
//        routes.get(.anything, use: self.controller.postView)
    }
}
