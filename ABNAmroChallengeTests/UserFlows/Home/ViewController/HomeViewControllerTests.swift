//
//  HomeViewControllerTests.swift
//  ABNAmroChallengeTests
//
//  Created by angst on 27/03/2023.
//

import XCTest
@testable import ABNAmroChallenge

class HomeViewControllerTests: XCTestCase {
    private let presenterMock = HomePresenterMock()
    
    override func tearDown() {
        presenterMock.clean()
    }
    
    private func createSut() -> HomeViewController {
        return HomeViewController(presenter: presenterMock)
    }
    
    func testViewWillAppear() {
        //given
        let sut = createSut()
        
        //when
        sut.viewWillAppear(true)
        
        //then
        XCTAssertEqual(presenterMock.viewWillAppear_countSpy, 1)
    }
    
    func testViewWillDisappear() {
        //given
        let sut = createSut()
        
        //when
        sut.viewWillDisappear(true)
        
        //then
        XCTAssertEqual(presenterMock.viewWillDisappear_countSpy, 1)
    }
    
    func testTakeMeThereButtonWasTapped() {
        //given
        let sut = createSut()
        let customLocationSelectorView = CustomLocationSelectorView()
        
        //when
        sut.takeMeThereButtonWasTapped(customLocationSelectorView)
        
        //then
        XCTAssertEqual(presenterMock.takeMeThereButtonWasTapped_countSpy, 1)
        XCTAssertNil(presenterMock.takeMeThereButtonWasTapped_latitudeSpy)
        XCTAssertNil(presenterMock.takeMeThereButtonWasTapped_longitudeSpy)
    }
}
