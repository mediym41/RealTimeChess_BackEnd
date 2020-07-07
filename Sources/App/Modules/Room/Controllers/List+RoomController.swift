////
////  List+RoomController.swift
////  
////
////  Created by Mediym on 6/22/20.
////
//
//import Vapor
//
//extension RoomController {
//
//    typealias ListResponse = [ChessRoom.Public]
//
//    func list(req: Request) throws -> EventLoopFuture<ListResponse> {
//
//        guard let authFuture = try? req.requireAuth() else {
//            throw Abort(.unauthorized)
//        }
//
//        return authFuture.map { user in
//            return self.lobby.rooms.values.filter { room in
//                return room.isWaitingForPlayers
//            }.public + [ChessRoom.Public(source: ChessRoom(id: 121414, name: "Hardcore", password: nil)),ChessRoom.Public(source: ChessRoom(id: 23452, name: "Ukraine", password: "114141")),ChessRoom.Public(source: ChessRoom(id: 461361, name: "U.S.A", password: nil))]
//        }
//    }
//
//}
