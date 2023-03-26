//
//  WikipediaPageTests.swift
//  ABNAmroChallengeTests
//
//  Created by angst on 27/03/2023.
//

import XCTest
@testable import ABNAmroChallenge

class WikipediaPageTests: XCTestCase {
    func testWikipediaPagePlacesHost() {
        //given sut
        let sut = WikipediaPage.places
        
        //when
        let urlHost = sut.urlHost
        
        //then
        XCTAssertEqual(urlHost, "places")
    }
}

