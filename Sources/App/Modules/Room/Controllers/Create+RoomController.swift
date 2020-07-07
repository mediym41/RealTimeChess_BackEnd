//
//  Create+RoomController.swift
//  
//
//  Created by Mediym on 6/22/20.
//

import Vapor

//extension RoomController {
//    
//    struct CreationRequest: Content {
//        var name: String
//        var password: String?
//    }
//    
//    struct CreationResponse: Content {
//        var roomID: Int
//        var token: String
//    }
//
//    func create(req: Request) throws -> EventLoopFuture<CreationResponse> {
//        
//        guard let authFuture = try? req.requireAuth() else {
//            throw Abort(.unauthorized)
//        }
//        
//        return authFuture.flatMapThrowing { user -> CreationResponse in
//            let requestData = try req.content.decode(CreationRequest.self)
//            
//            let room = self.lobby.createRoom(name: requestData.name, password: requestData.password)
//            
//            return CreationResponse(roomID: room.id, token: room.accessToken.token)
//        }
//    }
//}
