//
//  WikipediaDeeplinkBuilderTests.swift
//  ABNAmroChallengeTests
//
//  Created by angst on 27/03/2023.
//

import XCTest
@testable import ABNAmroChallenge

class WikipediaDeeplinkBuilderTests: XCTestCase {
    private let sut = WikipediaDeeplinkBuilder(deeplinkBuilder: DeeplinkBuilder())
    
    override func tearDown() {
        sut.clean()
    }
    
    func testSimpleDeeplink() {
        //given sut
        
        //when
        let url = sut.with(page: .places)
                     .build()
        
        //then
        XCTAssertEqual(url?.absoluteString, "wikipedia://places")
    }
    
    func testDeeplinkWithPathAndOneQueryParam() {
        //given sut
        let queryKey = "key"
        let queryValue = "value"
        
        //when
        let url = sut.with(page: .places)
                     .with(queryParamKey: queryKey, queryParamValue: queryValue)
                     .build()
        
        //then
        XCTAssertEqual(url?.absoluteString, "wikipedia://places?key=value")
    }
    
    func testDeeplinkWithPathAndQueryParams() {
        //given sut
        let queryKey_one = "key_a"
        let queryValue_one = "value_a"
        let queryKey_two = "key_b"
        let queryValue_two = "value_b"
        
        //when
        let url = sut.with(page: .places)
                     .with(queryParamKey: queryKey_one, queryParamValue: queryValue_one)
                     .with(queryParamKey: queryKey_two, queryParamValue: queryValue_two)
                     .build()
        
        //then
        let possibleUrls = [
            "wikipedia://places?key_a=value_a&key_b=value_b",
            "wikipedia://places?key_b=value_b&key_a=value_a"
        ]
        
        XCTAssertTrue(possibleUrls.contains(url!.absoluteString))
    }
}

