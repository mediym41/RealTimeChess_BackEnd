//
//  Publishable.swift
//  
//
//  Created by Mediym on 6/19/20.
//

import Vapor

protocol Publishable {
    
    associatedtype Public: Content
    
    var `public`: Public { get }
    
}

extension EventLoopFuture where Value: Publishable {
    
    func convertToPublic() -> EventLoopFuture<Value.Public> {
        return map { $0.public }
    }
    
}

extension Collection where Element: Publishable {
    
    var `public`: [Element.Public] {
        return map { $0.public }
    }
    
}
