//
//  SessionController.swift
//  
//
//  Created by Mediym on 6/19/20.
//

import Vapor
import Fluent

extension SessionController {
        
    typealias RegisterResponse = User.Public
    
    func register(req: Request) throws -> EventLoopFuture<RegisterResponse> {
        
        // TODO: Find tool for localization
        let localeRawValue = req.headers.first(name: .acceptLanguage)
        let locale = localeRawValue.flatMap(Language.init) ?? .default
        
        return User(name: locale.defaultUserName, locale: locale.rawValue)
                .createAndUse(on: req.db)
                .convertToPublic()
    }
    
}
