//
//  HomeInteractorMock.swift
//  ABNAmroChallengeTests
//
//  Created by angst on 27/03/2023.
//

import Foundation
@testable import ABNAmroChallenge

class HomeInteractorMock: HomeInteractorProtocol {
    var getLocations_countSpy = 0
    var getLocationsShouldSucceed = true
    
    func getLocations(onCompletion completionHandler: @escaping (Result<ABNAmroChallenge.LocationsViewModel, Error>) -> Void) {
        getLocations_countSpy += 1
        if getLocationsShouldSucceed {
            completionHandler(.success(LocationsViewModel(locations: [])))
        } else {
            completionHandler(.failure(ErrorType.service))
        }
    }
    
    func clean() {
        getLocations_countSpy = 0
    }
}
