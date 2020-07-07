//
//  GameRoomPayload.swift
//  
//
//  Created by Mediym on 7/4/20.
//

struct GameRoomInfoPayload: Codable {
    var team: String
    var room: ChessRoom.Public
}

