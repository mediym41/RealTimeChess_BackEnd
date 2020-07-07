//
//  GameErrorPayload.swift
//  
//
//  Created by Mediym on 7/4/20.
//

enum GameErrorPayload: Codable, Error {
    
    case unauth
    case badRequest
    case custom(String)
    
    var rawValue: String {
        switch self {
        case .unauth:
            return "unauthorized"
        case .badRequest:
            return "bad_request"
        case .custom(let value):
            return value
        }
    }
    
    init(rawValue: String) {
        switch rawValue {
        case "unauthorized":
            self = .unauth
        case "bad_request":
            self = .badRequest
        default:
            self = .custom(rawValue)
        }
    }
    
    init(error: Error) {
        if let error = error as? GameErrorPayload {
            self = error
        } else {
            self = .custom(error.localizedDescription)
        }
    }
    
    // MARK: Codable
    
    enum CodingKeys: String, CodingKey {
        case type
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(rawValue, forKey: .type)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let value = try container.decode(String.self, forKey: .type)
        
        self.init(rawValue: value)
    }
    
}
