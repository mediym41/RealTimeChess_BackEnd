//
//  GameModule.swift
//  
//
//  Created by Mediym on 6/20/20.
//

import Vapor
import Fluent

struct GameModule: Module {
    
    var router: RouteCollection? {
        return GameRouter()
    }

    var migrations: [Migration] {
        return [
            // User.Migration()
        ]
    }
}
