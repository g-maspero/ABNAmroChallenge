//
//  HomeRouter.swift
//  ABNAmroChallenge
//
//  Created by angst on 26/03/2023.
//

import UIKit

protocol HomeRouterProtocol: BaseRouterProtocol {
    func openWikipediaAppFor(latitude: Double, longitude: Double)
}

class HomeRouter: BaseRouter, HomeRouterProtocol {
    private let wikipediaPlacesDeeplinkBuilder: WikipediaPlacesDeeplinkBuilderProtocol
    
    init(wikipediaPlacesDeeplinkBuilder: WikipediaPlacesDeeplinkBuilderProtocol) {
        self.wikipediaPlacesDeeplinkBuilder = wikipediaPlacesDeeplinkBuilder
    }
    
    func openWikipediaAppFor(latitude: Double, longitude: Double) {
        guard let deeplink = wikipediaPlacesDeeplinkBuilder.with(latitude: latitude)
                                                           .with(longitude: longitude)
                                                           .build() else {
            print("Could not open deeplink")
            return
        }
        
        if UIApplication.shared.canOpenURL(deeplink) {
            UIApplication.shared.open(deeplink, options: [:], completionHandler: nil)
        }
    }
}
