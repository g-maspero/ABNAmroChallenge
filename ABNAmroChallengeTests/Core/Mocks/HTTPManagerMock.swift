//
//  HTTPManagerMock.swift
//  ABNAmroChallengeTests
//
//  Created by angst on 27/03/2023.
//

import XCTest
@testable import ABNAmroChallenge

class HTTPManagerMock: HTTPManagerProtocol {
    var getCalled = false
    var getURL: String?
    var getParams: [String: Any]?
    var putCalled = false
    var putURL: String?
    var putParams: [String: Any]?
    var postCalled = false
    var postURL: String?
    var postParams: [String: Any]?
    
    func get(_ url: String, params: [String : Any]?, onCompletion completionHandler: @escaping (Result<Data, Error>) -> Void) {
        getCalled = true
        getURL = url
        getParams = params
    }
    
    func put(_ url: String, params: [String : Any]?, onCompletion completionHandler: @escaping (Result<Data, Error>) -> Void) {
        putCalled = true
        putURL = url
        putParams = params
    }
    
    func post(_ url: String, params: [String : Any]?, onCompletion completionHandler: @escaping (Result<Data, Error>) -> Void) {
        postCalled = true
        postURL = url
        postParams = params
    }
    
    func clean() {
        getCalled = false
        getURL = nil
        getParams = nil
        putCalled = false
        putURL = nil
        putParams = nil
        postCalled = false
        postURL = nil
        postParams = nil
    }
}

