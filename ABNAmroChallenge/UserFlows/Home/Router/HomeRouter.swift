//
//  HomeRouter.swift
//  ABNAmroChallenge
//
//  Created by angst on 26/03/2023.
//

import UIKit

protocol HomeRouterProtocol: BaseRouterProtocol {
    func openWikipediaAppFor(latitude: Double, longitude: Double) -> Bool
}

class HomeRouter: BaseRouter, HomeRouterProtocol {
    private let wikipediaPlacesDeeplinkBuilder: WikipediaPlacesDeeplinkBuilderProtocol
    
    init(wikipediaPlacesDeeplinkBuilder: WikipediaPlacesDeeplinkBuilderProtocol) {
        self.wikipediaPlacesDeeplinkBuilder = wikipediaPlacesDeeplinkBuilder
    }
    
    func openWikipediaAppFor(latitude: Double, longitude: Double) -> Bool {
        guard let deeplink = wikipediaPlacesDeeplinkBuilder.with(latitude: latitude)
                                                           .with(longitude: longitude)
                                                           .build(),
              UIApplication.shared.canOpenURL(deeplink) else {
            return false
        }
        
        UIApplication.shared.open(deeplink, options: [:], completionHandler: nil)
        return true
    }
}
