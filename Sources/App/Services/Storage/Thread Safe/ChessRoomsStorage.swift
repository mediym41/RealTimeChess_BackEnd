//
//  ChessRoomsStorage.swift
//  
//
//  Created by Mediym on 7/2/20.
//

import NIO

final class ChessLobbiesStorage: ThreadSafeStorage {
    
    static let shared: ChessLobbiesStorage = ChessLobbiesStorage()
    
    var eventLoops: [EventLoop] = []
    
    var publicLobby: ChessLobby = ChessLobby()
    
    var privateLobby: ChessLobby = ChessLobby()
    
    var rooms: [ChessRoom] = []
    
    init() {
        self.eventLoops = EventLoopGroupStorage.eventLoops
    }

}
