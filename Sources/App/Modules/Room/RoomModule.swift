//
//  RoomModule.swift
//  
//
//  Created by Mediym on 6/22/20.
//

import Vapor
import Fluent

struct RoomModule: Module {
    
    var router: RouteCollection? {
        return RoomRouter()
    }

    var migrations: [Migration] {
        return [
            // User.Migration()
        ]
    }
}
