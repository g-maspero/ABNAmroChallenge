//
//  RestClientTests.swift
//  ABNAmroChallengeTests
//
//  Created by angst on 27/03/2023.
//

import XCTest
@testable import ABNAmroChallenge

class RestClientTests: XCTestCase {
    private struct DummmyDTO: Codable {}
    private let httpManagerMock = HTTPManagerMock()
    private let dummyURL = ""
    private let dummyParams: [String: Any] = [:]
    
    override func tearDown() {
        httpManagerMock.clean()
    }
    
    func testGet() {
        //given
        let restClient = RestClient<DummmyDTO>(httpManager: httpManagerMock)
        
        //when
        restClient.get(dummyURL, params: dummyParams) { result in }
        
        //then
        XCTAssertTrue(httpManagerMock.getCalled)
        XCTAssertEqual(httpManagerMock.getURL, dummyURL)
        XCTAssertEqual(httpManagerMock.getParams?.count, 0)
        XCTAssertFalse(httpManagerMock.putCalled)
        XCTAssertNil(httpManagerMock.putURL)
        XCTAssertNil(httpManagerMock.putParams)
        XCTAssertFalse(httpManagerMock.postCalled)
        XCTAssertNil(httpManagerMock.postURL)
        XCTAssertNil(httpManagerMock.postParams)
    }
    
    func testPut() {
        //given
        let restClient = RestClient<DummmyDTO>(httpManager: httpManagerMock)
        
        //when
        restClient.put(dummyURL, params: dummyParams) { result in }
        
        //then
        XCTAssertTrue(httpManagerMock.putCalled)
        XCTAssertEqual(httpManagerMock.putURL, dummyURL)
        XCTAssertEqual(httpManagerMock.putParams?.count, 0)
        XCTAssertFalse(httpManagerMock.getCalled)
        XCTAssertNil(httpManagerMock.getURL)
        XCTAssertNil(httpManagerMock.getParams)
        XCTAssertFalse(httpManagerMock.postCalled)
        XCTAssertNil(httpManagerMock.postURL)
        XCTAssertNil(httpManagerMock.postParams)
    }
    
    func testPost() {
        //given
        let restClient = RestClient<DummmyDTO>(httpManager: httpManagerMock)
        
        //when
        restClient.post(dummyURL, params: dummyParams) { result in }
        
        //then
        XCTAssertTrue(httpManagerMock.postCalled)
        XCTAssertEqual(httpManagerMock.postURL, dummyURL)
        XCTAssertEqual(httpManagerMock.postParams?.count, 0)
        XCTAssertFalse(httpManagerMock.getCalled)
        XCTAssertNil(httpManagerMock.getURL)
        XCTAssertNil(httpManagerMock.getParams)
        XCTAssertFalse(httpManagerMock.putCalled)
        XCTAssertNil(httpManagerMock.putURL)
        XCTAssertNil(httpManagerMock.putParams)
    }
}
