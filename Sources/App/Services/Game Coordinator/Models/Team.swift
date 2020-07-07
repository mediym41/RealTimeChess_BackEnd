//
//  Team.swift
//  
//
//  Created by Mediym on 7/4/20.
//

enum Team: Int {
    case white
    case black
    
    var name: String {
        switch self {
        case .white:
            return "white"
        case .black:
            return "black"
        }
    }
        
    var isWhite: Bool {
        return self == .white
    }
    
    var isBlack: Bool {
        return self == .black
    }
}

