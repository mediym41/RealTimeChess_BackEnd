//
//  Model+Extension.swift
//  
//
//  Created by Mediym on 6/19/20.
//

import Vapor
import Fluent

extension Model {
    
    func createAndUse(on database: Database) -> EventLoopFuture<Self> {
        return create(on: database).map { self }
    }
    
    func saveAndUse(on database: Database) -> EventLoopFuture<Self> {
        return save(on: database).map { self }
    }
    
}
