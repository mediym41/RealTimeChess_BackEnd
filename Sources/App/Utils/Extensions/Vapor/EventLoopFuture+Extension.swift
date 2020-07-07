//
//  EventLoopFuture+Extension.swift
//  
//
//  Created by Mediym on 7/4/20.
//

import NIO

extension EventLoopFuture {
    
    func log(label: String) {
        self.whenComplete { result in
            switch result {
            case .success(let value):
                print("[STATUS] \(label) task was complete succeessful with value: \(value)")
            case .failure(let error):
                print("[STATUS] \(label) task was failed with error: \(error.localizedDescription)")
            }
        }
    }
    
    func unwrap<Wrapped>(or error: @escaping @autoclosure () -> Error) -> EventLoopFuture<Wrapped> where Value == Optional<Wrapped> {
        
        return flatMap { value in
            if let value = value {
                return self.eventLoop.makeSucceededFuture(value)
            } else {
                return self.eventLoop.makeFailedFuture(error())
            }
        }
    }
}

