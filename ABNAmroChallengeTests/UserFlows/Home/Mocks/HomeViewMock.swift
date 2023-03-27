//
//  HomeViewMock.swift
//  ABNAmroChallengeTests
//
//  Created by angst on 27/03/2023.
//

import UIKit
@testable import ABNAmroChallenge

class HomeViewMock: UIViewController, HomeViewProtocol {
    var displayLocations_countSpy = 0
    var setupCustomLocationSelector_countSpy = 0
    var showLoader_countSpy = 0
    var hideLoader_countSpy = 0
    var presentOKAlert_countSpy = 0
    
    func displayLocations(_ locationsViewModel: LocationsViewModel) {
        displayLocations_countSpy += 1
    }
    
    func setupCustomLocationSelector(with viewModel: CustomLocationSelectorViewModel) {
        setupCustomLocationSelector_countSpy += 1
    }
    
    func showLoader() {
        showLoader_countSpy += 1
    }
    
    func hideLoader() {
        hideLoader_countSpy += 1
    }
    
    func presentOKAlert(title: String, message: String) {
        presentOKAlert_countSpy += 1
    }
    
    func clean() {
        displayLocations_countSpy = 0
        setupCustomLocationSelector_countSpy = 0
        showLoader_countSpy = 0
        hideLoader_countSpy = 0
        presentOKAlert_countSpy = 0
    }
}
