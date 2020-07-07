//
//  Rename+SessionController.swift
//  
//
//  Created by Mediym on 7/2/20.
//

import Vapor
import Fluent

extension SessionController {
        
    struct RenameRequest: Content {
        var name: String
    }
    
    typealias RenameResponse = User.Public
    
    func rename(req: Request) throws -> EventLoopFuture<RenameResponse> {
        
        let requestData = try req.content.decode(RenameRequest.self)
        
        guard let authFuture = try? req.requireAuth() else {
            throw Abort(.unauthorized)
        }
        
        return authFuture.flatMap { user -> EventLoopFuture<User.Public> in
            
            user.name = requestData.name
            
            return user
                .saveAndUse(on: req.db)
                .convertToPublic()
        }
    }
    
}
