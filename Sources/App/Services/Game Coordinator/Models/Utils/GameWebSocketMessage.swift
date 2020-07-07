//
//  GameWebsocketMessage.swift
//  
//
//  Created by Mediym on 7/4/20.
//

import Vapor

struct GameWebsocketMessage<Payload: Codable>: Content {
    
    var kind: Kind
    var data: Payload
    
    enum Kind: String, Codable {
        case roomInfo = "room_info"
        case error = "error"
    }
}
