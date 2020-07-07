//
//  Connect.swift
//  
//
//  Created by Mediym on 7/5/20.
//

import Vapor

extension RoomController {

    func connectPrivate(req: Request, ws: WebSocket) {
        
        guard let roomID: Int = req.parameters.get("roomID") else {
            let data: GameErrorPayload = .badRequest
            let messsage = GameWebsocketMessage(kind: .error, data: data)
            ws.exceptionClose(error: messsage)
            return
        }
        
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
                                 on: req.eventLoop) { (lobby: ChessLobby) -> ChessRoom? in
                                    
                    let client = WebSocketClient(user: user, socket: ws)
                    return lobby.connectToRoom(with: roomID, client: client)
            }.unwrap(or: GameErrorPayload.badRequest)
        }.whenComplete { result in
            switch result {
            case .success(let room):
                let data = GameRoomInfoPayload(team: room.clientTeam.name, room: room.public)
                let message = GameWebsocketMessage(kind: .roomInfo, data: data)
                ws.send(object: message).log(label: "Websocket(connection) room info")
                
            case .failure(let error):
                let data = GameErrorPayload(error: error)
                let message = GameWebsocketMessage(kind: .error, data: data)
                ws.exceptionClose(error: message).log(label: "Websocket(connection) room info failure")
            }
        }
    }
}

