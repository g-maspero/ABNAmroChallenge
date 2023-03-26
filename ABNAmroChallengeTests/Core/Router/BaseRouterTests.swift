//
//  BaseRouterTests.swift
//  ABNAmroChallengeTests
//
//  Created by angst on 27/03/2023.
//

import XCTest
@testable import ABNAmroChallenge

class BaseRouterTests: XCTestCase {
    func testBaseRouter() {
        //given
        let navigationController = UINavigationController()
        let sut = BaseRouter()
        sut.navigation = { navigationController }
        
        //when
        let routerNavigationController = sut.navigationController
        
        //then
        XCTAssertIdentical(navigationController, routerNavigationController)
    }
}
