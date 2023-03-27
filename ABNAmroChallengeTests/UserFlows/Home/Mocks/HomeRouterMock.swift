//
//  HomeRouterMock.swift
//  ABNAmroChallengeTests
//
//  Created by angst on 27/03/2023.
//

import UIKit
@testable import ABNAmroChallenge

class HomeRouterMock: HomeRouterProtocol {
    var openWikipediaApp_countSpy = 0
    var openWikipediaApp_latitudeSpy: Double?
    var openWikipediaApp_longitudeSpy: Double?
    var shouldGiveErrorForOpenWikiApp = false
    
    var navigation: (() -> UINavigationController?) = { return nil }
    
    func openWikipediaAppFor(latitude: Double, longitude: Double) -> Bool {
        openWikipediaApp_countSpy += 1
        openWikipediaApp_latitudeSpy = latitude
        openWikipediaApp_longitudeSpy = longitude
        
        return !shouldGiveErrorForOpenWikiApp
    }
    
    func clean() {
        openWikipediaApp_countSpy = 0
        openWikipediaApp_latitudeSpy = nil
        openWikipediaApp_longitudeSpy = nil
    }
}
