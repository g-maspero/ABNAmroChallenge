//
//  HomePresenterTests.swift
//  ABNAmroChallengeTests
//
//  Created by angst on 27/03/2023.
//

import XCTest
@testable import ABNAmroChallenge

class HomePresenterTests: XCTestCase {
    private let interactorMock = HomeInteractorMock()
    private let routerMock = HomeRouterMock()
    private let viewMock = HomeViewMock()
    
    override func tearDown() {
        interactorMock.clean()
        routerMock.clean()
        viewMock.clean()
    }
    
    private func createSut() -> HomePresenter {
        let sut = HomePresenter(interactor: interactorMock,
                                router: routerMock)
        sut.view = viewMock
        
        return sut
    }
    
    func testViewIsReady_getLocationsSucceed() {
        //given
        let sut = createSut()
        interactorMock.getLocationsShouldSucceed = true
        
        //when
        sut.viewIsReady()
        
        //then
        XCTAssertEqual(viewMock.showLoader_countSpy, 1)
        XCTAssertEqual(viewMock.setupCustomLocationSelector_countSpy, 1)
        XCTAssertEqual(interactorMock.getLocations_countSpy, 1)
        XCTAssertEqual(viewMock.displayLocations_countSpy, 1)
        XCTAssertEqual(viewMock.presentOKAlert_countSpy, 0)
    }
    
    func testViewIsReady_getLocationsFail() {
        //given
        let sut = createSut()
        interactorMock.getLocationsShouldSucceed = false
        
        //when
        sut.viewIsReady()
        
        //then
        XCTAssertEqual(viewMock.showLoader_countSpy, 1)
        XCTAssertEqual(viewMock.setupCustomLocationSelector_countSpy, 1)
        XCTAssertEqual(interactorMock.getLocations_countSpy, 1)
        XCTAssertEqual(viewMock.displayLocations_countSpy, 0)
        XCTAssertEqual(viewMock.presentOKAlert_countSpy, 1)
    }
    
    func testTakeMeThereButtonWasTapped_latitudeNil() {
        //given
        let sut = createSut()
        let longitude: Double = 50
        
        //when
        sut.takeMeThereButtonWasTapped(latitude: nil, longitude: longitude)
        
        //then
        XCTAssertEqual(viewMock.presentOKAlert_countSpy, 1)
        XCTAssertEqual(routerMock.openWikipediaApp_countSpy, 0)
    }
    
    func testTakeMeThereButtonWasTapped_longitudeNil() {
        //given
        let sut = createSut()
        let latitude: Double = 50
        
        //when
        sut.takeMeThereButtonWasTapped(latitude: latitude, longitude: nil)
        
        //then
        XCTAssertEqual(viewMock.presentOKAlert_countSpy, 1)
        XCTAssertEqual(routerMock.openWikipediaApp_countSpy, 0)
    }
    
    func testTakeMeThereButtonWasTapped_latitudeAndlongitudeNil() {
        //given
        let sut = createSut()
        
        //when
        sut.takeMeThereButtonWasTapped(latitude: nil, longitude: nil)
        
        //then
        XCTAssertEqual(viewMock.presentOKAlert_countSpy, 1)
        XCTAssertEqual(routerMock.openWikipediaApp_countSpy, 0)
    }
    
    func testTakeMeThereButtonWasTapped_validCoordinates() {
        //given
        let sut = createSut()
        let latitude: Double = 50
        let longitude: Double = 70
        
        //when
        sut.takeMeThereButtonWasTapped(latitude: latitude, longitude: longitude)
        
        //then
        XCTAssertEqual(viewMock.presentOKAlert_countSpy, 0)
        XCTAssertEqual(routerMock.openWikipediaApp_countSpy, 1)
    }
}
