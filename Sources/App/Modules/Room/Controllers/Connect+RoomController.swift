////
////  Connect+RoomController.swift
////  
////
////  Created by Mediym on 6/22/20.
////
//
//import Vapor
//
//extension RoomController {
//    
//    struct ConnectionRequest: Content {
//        var roomID: Int
//        var password: String?
//    }
//    
//    struct ConnectionResponse: Content {
//        var roomID: Int
//        var token: String
//    }
//    
//    func connect(req: Request) throws -> EventLoopFuture<ConnectionResponse> {
//        
//        guard let authFuture = try? req.requireAuth() else {
//            throw Abort(.unauthorized)
//        }
//        
//        return authFuture.flatMapThrowing { user in
//            let requestData = try req.content.decode(ConnectionRequest.self)
//                    
//            guard let room = self.lobby.rooms[requestData.roomID] else {
//                throw Abort(.badRequest, reason: "Unknown room")
//            }
//            
//            guard room.password == requestData.password else {
//                throw Abort(.badRequest, reason: "Wrong password")
//            }
//            
//            return ConnectionResponse(roomID: room.id, token: room.accessToken.token)
//        }
//    }
//    
//}
