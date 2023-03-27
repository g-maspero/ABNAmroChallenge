//
//  HomeRouterTests.swift
//  ABNAmroChallengeTests
//
//  Created by angst on 27/03/2023.
//

import XCTest
@testable import ABNAmroChallenge

class HomeRouterTests: XCTestCase {
    func testOpenWikipediaApp() {
        //given
        let wikipediaPlacesDeeplinkBuilderMock = WikipediaPlacesDeeplinkBuilderMock()
        let sut = HomeRouter(wikipediaPlacesDeeplinkBuilder: wikipediaPlacesDeeplinkBuilderMock)
        let latitude: Double = 50
        let longitude: Double = 80
        
        //when
        _ = sut.openWikipediaAppFor(latitude: latitude, longitude: longitude)
        
        //then
        XCTAssertEqual(wikipediaPlacesDeeplinkBuilderMock.withLatitude_countSpy, 1)
        XCTAssertEqual(wikipediaPlacesDeeplinkBuilderMock.withLatitude_latitudeSpy, latitude)
        XCTAssertEqual(wikipediaPlacesDeeplinkBuilderMock.withLongitude_countSpy, 1)
        XCTAssertEqual(wikipediaPlacesDeeplinkBuilderMock.withLongitude_longitudeSpy, longitude)
        XCTAssertEqual(wikipediaPlacesDeeplinkBuilderMock.build_countSpy, 1)
    }
}
