//
//  GameRouter.swift
//  
//
//  Created by Mediym on 6/20/20.
//

import Vapor

struct GameRouter: RouteCollection {
    
    let controller = GameController()
    
    func boot(routes: RoutesBuilder) throws {
        
        let group = routes.grouped("game")

//        group.webSocket(":roomID", onUpgrade: self.controller.connect)
    }
}
