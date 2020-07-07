//
//  File.swift
//  
//
//  Created by Mediym on 6/19/20.
//

import Fluent
import Vapor

final class User: Model, Content {
    
    static let schema = "users"

    struct FieldKeys {
        static var name: FieldKey { return "name" }
        static var locale: FieldKey { return "locale" }
    }
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: FieldKeys.name)
    var name: String
    
    @Field(key: FieldKeys.locale)
    var locale: String

    init() { }

    init(id: UUID? = nil, name: String, locale: String) {
        self.id = id
        self.name = name
        self.locale = locale
    }
}


extension User {
    struct Migration: Fluent.Migration {
        var name: String { "CreateUser" }

        func prepare(on database: Database) -> EventLoopFuture<Void> {
            database.schema("users")
                .id()
                .field(FieldKeys.name, .string, .required)
                .field(FieldKeys.locale, .string, .required)
                .create()
        }

        func revert(on database: Database) -> EventLoopFuture<Void> {
            database.schema("users").delete()
        }
    }
}

extension User: Publishable {
    
    struct Public: Content {
        var id: String?
        var name: String
        var locale: String
        
        init(source: User) {
            self.id = source.id?.token
            self.name = source.name
            self.locale = source.locale
        }
    }
    
    var `public`: Public {
        return .init(source: self)
    }
    
}
