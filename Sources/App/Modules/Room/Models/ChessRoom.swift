//
//  ChesssRoom.swift
//  
//
//  Created by Mediym on 6/20/20.
//

import Vapor

final class ChessRoom {
        
    var id: Int
    var date: Date
    
    private(set) var whitePlayer: WebSocketClient?
    private(set) var blackPlayer: WebSocketClient?
    
    var hostTeam: Team {
        return .white
    }
    
    var clientTeam: Team {
        return .black
    }
    
    var isWaitingForPlayers: Bool {
        return whitePlayer.isNil || blackPlayer.isNil
    }
    
    init(id: Int = .random(), host: WebSocketClient? = nil, client: WebSocketClient? = nil) {
        self.id = id
        self.date = Date()
        
        self.whitePlayer = host
        self.blackPlayer = client
    }
    
    func set(host: WebSocketClient) {
        self.whitePlayer = host
    }
    
    func set(client: WebSocketClient) {
        self.blackPlayer = client
    }

}

extension ChessRoom: Publishable {
    
    struct Public: Content {
                
        var id: Int
        var whitePlayer: String?
        var blackPlayer: String?
        
        init(source: ChessRoom) {
            self.id = source.id
            self.whitePlayer = source.whitePlayer?.user.name
            self.blackPlayer = source.blackPlayer?.user.name
        }
        
        enum EncodingKeys: String, CodingKey {
            case id
            case whitePlayer = "white_player"
            case blackPlayer = "black_player"
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: EncodingKeys.self)
            
            try container.encode(id, forKey: .id)
            try container.encode(whitePlayer, forKey: .whitePlayer)
            try container.encode(blackPlayer, forKey: .blackPlayer)
        }
    }
    
    var `public`: Public {
        return .init(source: self)
    }
    
}






















