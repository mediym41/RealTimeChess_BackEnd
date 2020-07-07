//
//  CreatePrivate+RoomController.swift
//  
//
//  Created by Mediym on 7/4/20.
//

import Vapor

extension RoomController {

    func createPrivate(req: Request, ws: WebSocket) {
        
        guard let authFuture = try? req.requireAuth() else {
            let data: GameErrorPayload = .unauth
            let message = GameWebsocketMessage(kind: .error, data: data)
            ws.exceptionClose(error: message).log(label: "Websocket unauth error")
            return
        }
    
        authFuture.flatMap { user -> EventLoopFuture<ChessRoom> in

            return self
                .threadSafeStorage
                .safeMapAction(keyPath: \.privateLobby,
                                 on: req.eventLoop) { (lobby: ChessLobby) in
                                    
                    let host = WebSocketClient(user: user, socket: ws)
                    return lobby.createRoom(host: host)
                }
        }.whenComplete { result in
            switch result {
            case .success(let room):
                let data = GameRoomInfoPayload(team: room.hostTeam.name, room: room.public)
                let message = GameWebsocketMessage(kind: .roomInfo, data: data)
                ws.send(object: message).log(label: "Websocket room info")
                
            case .failure(let error):
                let data: GameErrorPayload = .custom(error.localizedDescription)
                let message = GameWebsocketMessage(kind: .error, data: data)
                ws.exceptionClose(error: message).log(label: "Websocket room info failure")
            }
        }
    }
}

