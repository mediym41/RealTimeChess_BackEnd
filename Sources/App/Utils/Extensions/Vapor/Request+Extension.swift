//
//  Request+Extension.swift
//  
//
//  Created by Mediym on 6/20/20.
//

import Vapor
import Fluent

extension Request {
    
    func requireAuth() throws -> EventLoopFuture<User> {
        
        guard let accToken = headers.first(name: "Access-Token") else {
            throw Abort(.unauthorized)
        }
        
        guard let userID = UUID(token: accToken) else {
            throw Abort(.unauthorized)
        }
        
        return User
            .query(on: db)
            .filter(\.$id == userID)
            .first()
            .unwrap(or: Abort(.unauthorized))
        
    }
    
}
