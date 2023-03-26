//
//  WikipediaPlacesDeeplinkBuilderTests.swift
//  ABNAmroChallengeTests
//
//  Created by angst on 27/03/2023.
//

import XCTest
@testable import ABNAmroChallenge

class WikipediaPlacesDeeplinkBuilderTests: XCTestCase {
    private let sut = WikipediaPlacesDeeplinkBuilder(wikipediaDeeplinkBuilder: WikipediaDeeplinkBuilder(deeplinkBuilder: DeeplinkBuilder()))
    
    override func tearDown() {
        sut.clean()
    }
    
    func testSimpleDeeplink() {
        //given sut
        let latitude: Double = 50
        let longitude: Double = 40
        
        //when
        let url = sut.with(latitude: latitude)
                     .with(longitude: longitude)
                     .build()
        
        //then
        let possibleUrls = [
            "wikipedia://places?lon=\(longitude)&lat=\(latitude)",
            "wikipedia://places?lat=\(latitude)&lon=\(longitude)"
        ]
        XCTAssertTrue(possibleUrls.contains(url!.absoluteString))
    }
}
