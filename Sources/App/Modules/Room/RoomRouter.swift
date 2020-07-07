//
//  File.swift
//  
//
//  Created by Mediym on 6/22/20.
//

import Foundation

import Vapor

struct RoomRouter: RouteCollection {
    
    let controller = RoomController()
    
    func boot(routes: RoutesBuilder) throws {
        
        let group = routes.grouped("rooms")
        
//        group.get("list", use: controller.list)
//        group.post("create", use: controller.create)
//        group.post("connect", use: controller.connect)
//        group.get("random", use: controller.list)
        group.webSocket("private", "create", onUpgrade: controller.createPrivate)
        group.webSocket("private", "connect", ":roomID", onUpgrade: controller.connectPrivate)

//        group.webSocket("create", onUpgrade: self.controller.create)
//        group.webSocket("connect", ":roomID", onUpgrade: self.controller.connect)
    }
}

