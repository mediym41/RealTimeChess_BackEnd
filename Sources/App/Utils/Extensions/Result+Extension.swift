//
//  Result+Extension.swift
//  
//
//  Created by Mediym on 6/20/20.
//

extension Result {
    
    var isFaliure: Bool {
        switch self {
        case .success:
            return false
            
        case .failure:
            return true
        }
    }
    
    var isSuccess: Bool {
        switch self {
        case .success:
            return true
            
        case .failure:
            return false
        }
    }
    
}
