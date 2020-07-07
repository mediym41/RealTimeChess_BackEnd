//
//  UUID+Extension.swift
//  
//
//  Created by Mediym on 6/22/20.
//

import Foundation

extension UUID {

    init?(token: String) {
        guard token.count == 32 else {
            return nil
        }

        var uuidString = token

        let startIndex = token.startIndex
        uuidString.insert("-", at: uuidString.index(startIndex, offsetBy: 20))
        uuidString.insert("-", at: uuidString.index(startIndex, offsetBy: 16))
        uuidString.insert("-", at: uuidString.index(startIndex, offsetBy: 12))
        uuidString.insert("-", at: uuidString.index(startIndex, offsetBy: 8))

        self.init(uuidString: uuidString)
    }
    
    var token: String {
        return uuidString
            .replacingOccurrences(of: "-", with: "")
            .lowercased()
    }

}
