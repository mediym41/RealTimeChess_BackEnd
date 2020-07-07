//
//  File.swift
//  
//
//  Created by Mediym on 6/20/20.
//

extension KeyedEncodingContainer {
        
    mutating func encode(_ value: String?, forKey key: KeyedEncodingContainer<K>.Key) throws {
        if let value = value {
            try encode(value, forKey: key)
        } else {
            try encodeNil(forKey: key)
        }
    }
    
    mutating func encode(_ value: Int?, forKey key: KeyedEncodingContainer<K>.Key) throws {
        if let value = value {
            try encode(value, forKey: key)
        } else {
            try encodeNil(forKey: key)
        }
    }
    
    
    mutating func encode(_ value: Double?, forKey key: KeyedEncodingContainer<K>.Key) throws {
        if let value = value {
            try encode(value, forKey: key)
        } else {
            try encodeNil(forKey: key)
        }
    }
    
    mutating func encode(_ value: Bool?, forKey key: KeyedEncodingContainer<K>.Key) throws {
        if let value = value {
            try encode(value, forKey: key)
        } else {
            try encodeNil(forKey: key)
        }
    }
}
