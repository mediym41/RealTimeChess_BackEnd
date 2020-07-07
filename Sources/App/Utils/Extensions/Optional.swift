//
//  File.swift
//  
//
//  Created by Mediym on 6/20/20.
//

extension Optional {
    
    var isNil: Bool {
        switch self {
        case .some:
            return false
            
        case .none:
            return true
        }
    }
    
    var isNotNil: Bool {
        switch self {
        case .some:
            return true
            
        case .none:
            return false
        }
    }
    
}
