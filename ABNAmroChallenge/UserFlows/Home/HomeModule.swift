//
//  HomeModule.swift
//  ABNAmroChallenge
//
//  Created by angst on 26/03/2023.
//

import UIKit

class HomeModule {
    static let shared = HomeModule()
    
    private init() {}
    
    func assemble() -> UIViewController {
        let homeRouter = HomeRouter(wikipediaPlacesDeeplinkBuilder: WikipediaPlacesDeeplinkBuilder(wikipediaDeeplinkBuilder: WikipediaDeeplinkBuilder(deeplinkBuilder: DeeplinkBuilder())))
        let homeInteractor = HomeInteractor(locationRepository: LocationRepository(),
                                            viewMapper: LocationsViewMapper())
        let homePresenter = HomePresenter(interactor: homeInteractor,
                                          router: homeRouter)
        let homeViewController = HomeViewController(presenter: homePresenter)
        homeRouter.navigation = { homeViewController.navigationController }
        
        return homeViewController
    }
}
