//
//  DeeplinkBuilderTests.swift
//  ABNAmroChallengeTests
//
//  Created by angst on 27/03/2023.
//

import XCTest
@testable import ABNAmroChallenge

class DeeplinkBuilderTests: XCTestCase {
    private let sut = DeeplinkBuilder()
    
    override func tearDown() {
        sut.clean()
    }
    
    func testSimpleDeeplink() {
        //given sut
        let scheme = "wikipedia"
        let host = "places"
        
        //when
        let url = sut.with(scheme: scheme)
                     .with(host: host)
                     .build()
        
        //then
        XCTAssertEqual(url?.absoluteString, "wikipedia://places")
    }
    
    func testDeeplinkWithPathNoQueryParams() {
        //given sut
        let scheme = "wikipedia"
        let host = "places"
        let path = "foo"
        
        //when
        let url = sut.with(scheme: scheme)
                     .with(host: host)
                     .with(path: path)
                     .build()
        
        //then
        XCTAssertEqual(url?.absoluteString, "wikipedia://places/foo")
    }
    
    func testDeeplinkWithPathAndOneQueryParam() {
        //given sut
        let scheme = "wikipedia"
        let host = "places"
        let path = "foo"
        let queryKey = "key"
        let queryValue = "value"
        
        //when
        let url = sut.with(scheme: scheme)
                     .with(host: host)
                     .with(path: path)
                     .with(queryParamKey: queryKey, queryParamValue: queryValue)
                     .build()
        
        //then
        XCTAssertEqual(url?.absoluteString, "wikipedia://places/foo?key=value")
    }
    
    func testDeeplinkWithPathAndQueryParams() {
        //given sut
        let scheme = "wikipedia"
        let host = "places"
        let path = "foo"
        let queryKey_one = "key_a"
        let queryValue_one = "value_a"
        let queryKey_two = "key_b"
        let queryValue_two = "value_b"
        
        //when
        let url = sut.with(scheme: scheme)
                     .with(host: host)
                     .with(path: path)
                     .with(queryParamKey: queryKey_one, queryParamValue: queryValue_one)
                     .with(queryParamKey: queryKey_two, queryParamValue: queryValue_two)
                     .build()
        
        //then
        let possibleUrls = [
            "wikipedia://places/foo?key_a=value_a&key_b=value_b",
            "wikipedia://places/foo?key_b=value_b&key_a=value_a"
        ]
        
        XCTAssertTrue(possibleUrls.contains(url!.absoluteString))
    }
}
