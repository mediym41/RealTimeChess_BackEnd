//
//  Localization.swift
//  
//
//  Created by Mediym on 7/3/20.
//

enum Language: String {
    
    case english = "en"
    case russian = "ru"
    case ukrainian = "uk"
    
    static var `default`: Language {
        return .english
    }
    
}


extension Language {
    
    var defaultUserName: String {
        switch self {
        case .english:   return "Player"
        case .russian:   return "Игрок"
        case .ukrainian: return "Гравець"
        }
    }
    
}
