//
//  ErrorType.swift
//  ABNAmroChallenge
//
//  Created by angst on 26/03/2023.
//

import Foundation

enum ErrorType: String, Error {
    case mapping = "MAPPING"
    case service = "SERVICE"
    case connection = "CONNECTION"
    case weakSelf = "WEAK_SELF"
    case `guard` = "GUARD"
    case unknown = "UNKNOWN"

    public init(_ error: Error) {
        if let error = error as? ErrorType {
            self = error
        } else {
            self = .unknown
        }
    }
}
