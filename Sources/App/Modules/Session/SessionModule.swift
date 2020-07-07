//
//  SessionModule.swift
//  
//
//  Created by Mediym on 6/19/20.
//

import Vapor
import Fluent

struct SessionModule: Module {
    
    var router: RouteCollection? {
        return SessionRouter()
    }

    var migrations: [Migration] {
        return [
            User.Migration()
        ]
    }
}
