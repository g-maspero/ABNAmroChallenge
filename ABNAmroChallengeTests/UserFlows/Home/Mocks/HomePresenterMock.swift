//
//  HomePresenterMock.swift
//  ABNAmroChallengeTests
//
//  Created by angst on 27/03/2023.
//

import Foundation
@testable import ABNAmroChallenge

class HomePresenterMock: HomePresenterProtocol {
    var cellWasTapped_countSpy = 0
    var cellWasTapped_indexPathSpy: IndexPath?
    var takeMeThereButtonWasTapped_countSpy = 0
    var takeMeThereButtonWasTapped_latitudeSpy: Double?
    var takeMeThereButtonWasTapped_longitudeSpy: Double?
    var viewIsReady_countSpy = 0
    var viewWillAppear_countSpy = 0
    var viewWillDisappear_countSpy = 0
    
    var view: ABNAmroChallenge.HomeViewProtocol?
    
    func cellWasTapped(at indexPath: IndexPath) {
        cellWasTapped_countSpy += 1
        cellWasTapped_indexPathSpy = indexPath
    }
    
    func takeMeThereButtonWasTapped(latitude: Double?, longitude: Double?) {
        takeMeThereButtonWasTapped_countSpy += 1
        takeMeThereButtonWasTapped_latitudeSpy = latitude
        takeMeThereButtonWasTapped_longitudeSpy = longitude
    }
    
    func viewIsReady() {
        viewIsReady_countSpy += 1
    }
    
    func viewWillAppear() {
        viewWillAppear_countSpy += 1
    }
    
    func viewWillDisappear() {
        viewWillDisappear_countSpy += 1
    }
    
    func clean() {
        cellWasTapped_countSpy = 0
        cellWasTapped_indexPathSpy = nil
        takeMeThereButtonWasTapped_countSpy = 0
        takeMeThereButtonWasTapped_latitudeSpy = nil
        takeMeThereButtonWasTapped_longitudeSpy = nil
        viewIsReady_countSpy = 0
        viewWillAppear_countSpy = 0
        viewWillDisappear_countSpy = 0
    }
}
