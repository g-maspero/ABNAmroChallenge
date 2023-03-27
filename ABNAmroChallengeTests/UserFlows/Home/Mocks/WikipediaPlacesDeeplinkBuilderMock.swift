//
//  WikipediaPlacesDeeplinkBuilderMock.swift
//  ABNAmroChallengeTests
//
//  Created by angst on 27/03/2023.
//

import Foundation
@testable import ABNAmroChallenge

class WikipediaPlacesDeeplinkBuilderMock: WikipediaPlacesDeeplinkBuilderProtocol {
    var withLatitude_countSpy = 0
    var withLatitude_latitudeSpy: Double?
    var withLongitude_countSpy = 0
    var withLongitude_longitudeSpy: Double?
    var build_countSpy = 0
    
    func with(latitude: Double) -> Self {
        withLatitude_countSpy += 1
        withLatitude_latitudeSpy = latitude
        return self
    }
    
    func with(longitude: Double) -> Self {
        withLongitude_countSpy += 1
        withLongitude_longitudeSpy = longitude
        return self
    }
    
    func build() -> URL? {
        build_countSpy += 1
        return nil
    }
    
    func clean() {
        
    }
    
    func cleanMock() {
        withLatitude_countSpy = 0
        withLatitude_latitudeSpy = nil
        withLongitude_countSpy = 0
        withLongitude_longitudeSpy = nil
        build_countSpy = 0
    }
}
