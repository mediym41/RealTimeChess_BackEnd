//
//  CreateRoom+GameController.swift
//  
//
//  Created by Mediym on 6/20/20.
//

import Vapor

extension GameController {
    
//    struct ChessRequest: Content {
//        enum Kind: String, Codable {
//            case createRoom = "create_room"
//            case connectToRoom = "connect_to_room"
//        }
//        
//        var kind: Kind
//        var data: Data
//    }
//    
//    func connect(req: Request, ws: WebSocket) {
//        
//        guard let roomID = req.parameters.get("roomID", as: Int.self) else {
//            _ = ws.close(code: .unacceptableData)
//            return
//        }
//        
//        guard let room = self.lobby.rooms[roomID] else {
//            _ = ws.close(code: .unacceptableData)
//            return
//        }
//                
//        guard let roomAccessToken = req.headers.first(name: "Room-Access-Token") else {
//            _ = ws.close(code: .unacceptableData)
//            return
//        }
//        
//        guard roomAccessToken == room.accessToken.token else {
//            _ = ws.close(code: .unacceptableData)
//            return
//        }
//        
//        guard let authFuture = try? req.requireAuth() else {
//            _ = ws.close(code: .unacceptableData)
//            return
//        }
//        
//        authFuture.whenSuccess { user in
//         
//            let webSocketClient = WebSocketClient(user: user, socket: ws)
//            
//            if room.host.isNil {
//                room.host = webSocketClient
//            } else if room.client.isNil {
//                room.client = webSocketClient
//            } else {
//                _ = ws.close(code: .unacceptableData)
//            }
//        }
//    }
//    
//    static var a = false
//    func create(req: Request, ws: WebSocket) {
//        
////        let promise = req.eventLoop.makePromise(of: Void.self)
//        
//
//
//        //ws.close(code: .normalClosure)
////        GameController.link = promise.futureResult.flatMap { _ -> EventLoopFuture<Void> in
////            print("Sended")
////            return
////        }
////
//        ws.onClose.always { _ in
//            print("Closed connection")
//        }
//        
//        ws.onText { ws, text in
//            print(text)
//            
////            if GameController.a == false {
////                ws.close(code: .goingAway)
////                GameController.a = true
////            }
//            ws.send(text: "Ща закрою").whenSuccess { _ in
//                ws.close(code: .goingAway).whenSuccess { _ in
//                    print("DONE")
//                }
//            }
//            
//        }
//        
//        
//        return
//        
//        guard let authFuture = try? req.requireAuth() else {
//            ws.exceptionClose(error: "You should use roomID")
//            return
//        }
//        
//        authFuture.whenSuccess { user in
//            
//            let webSocketClient = WebSocketClient(user: user, socket: ws)
//            
//            self.lobby.createRoom(for: webSocketClient)
//        }
//    }
    
}




