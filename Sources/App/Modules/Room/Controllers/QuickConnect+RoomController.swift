////
////  File.swift
////  
////
////  Created by Mediym on 6/23/20.
////
//
//import Vapor
//
//extension RoomController {
//        
//    struct QuickConnectionResponse: Content {
//        var roomID: Int
//        var token: String
//    }
//    
//    func quickConnect(req: Request) throws -> EventLoopFuture<QuickConnectionResponse> {
//        
//        guard let authFuture = try? req.requireAuth() else {
//            throw Abort(.unauthorized)
//        }
//        
//        return authFuture.flatMap { user -> EventLoopFuture<QuickConnectionResponse> in
//            
//            
//            let availableRooms = self.lobby.rooms.values.filter { room in
//                return room.isWaitingForPlayers && room.password.isNotNil
//            }
//            
//            do {
//                if let room = availableRooms.randomElement() {
//                    return try self.connect(req: req).map { response in
//                        return QuickConnectionResponse(roomID: response.roomID, token: response.token)
//                    }
//                } else {
//                    return try self.create(req: req).map { response in
//                        return QuickConnectionResponse(roomID: response.roomID, token: response.token)
//                    }
//                }
//            } catch {
//                return req.eventLoop.makeFailedFuture(error)
//            }
//        }
//    }
//    
//}
