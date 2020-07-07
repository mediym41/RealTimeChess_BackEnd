//
//  ChessLobby.swift
//  
//
//  Created by Mediym on 6/20/20.
//

final class ChessLobby {
    
    var rooms: [Int: ChessRoom] = [:]
    
    @discardableResult
    func createRoom(host: WebSocketClient) -> ChessRoom {
        
        var id: Int
        
        repeat {
            id = .random(in: 100...100000)
            
        } while rooms[id].isNotNil
        
        let room = ChessRoom(id: id, host: host)
        
        rooms[id] = room
        
        return room
    }
    
    @discardableResult
    func connectToRoom(with id: Int, client: WebSocketClient) -> ChessRoom? {
        
        guard let room = rooms[id] else {
            return nil
        }
        
        room.set(client: client)
        
        return room
    }
    
}
