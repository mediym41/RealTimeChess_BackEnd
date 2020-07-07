//
//  File.swift
//  
//
//  Created by Mediym on 6/20/20.
//

import Vapor

final class WebSocketClient {
    var user: User
    var socket: WebSocket
    
    init(user: User, socket: WebSocket) {
        self.user = user
        self.socket = socket
    }
    
}
