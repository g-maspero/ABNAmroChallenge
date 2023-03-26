//
//  HomePresenter.swift
//  ABNAmroChallenge
//
//  Created by angst on 26/03/2023.
//

import Foundation

protocol BasePresenterProtocol: AnyObject {
    func viewIsReady()
    func viewWillAppear()
    func viewWillDisappear()
}

extension BasePresenterProtocol {
    func viewIsReady() {}
    func viewWillAppear() {}
    func viewWillDisappear() {}
}

protocol HomePresenterProtocol: BasePresenterProtocol {
    var view: HomeViewProtocol? { get set }
    func cellWasTapped(at indexPath: IndexPath)
    func takeMeThereButtonWasTapped(latitude: Double?, longitude: Double?)
}

class HomePresenter {
    private let interactor: HomeInteractorProtocol
    private let router: HomeRouterProtocol
    
    weak var view: HomeViewProtocol?
    private var locationsViewModel: LocationsViewModel?
    
    init(interactor: HomeInteractorProtocol,
         router: HomeRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func viewIsReady() {
        view?.showLoader()
        view?.setupCustomLocationSelector(with: CustomLocationSelectorViewModel(title: HomeWording.CustomLocationSelectorTitle,
                                                                                latitudePlaceholder: HomeWording.CustomLocationSelectorLatitudePlaceholder,
                                                                                longitudePlaceholder: HomeWording.CustomLocationSelectorLongitudePlaceholder,
                                                                                buttonTitle: HomeWording.CustomLocationSelectorButtonTitle))
        getLocations()
    }
    
    private func getLocations() {
        interactor.getLocations() { [weak self] result in
            self?.view?.hideLoader()
            switch result {
            case .success(let locationsViewModel):
                self?.locationsViewModel = locationsViewModel
                self?.view?.displayLocations(locationsViewModel)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension HomePresenter: HomePresenterProtocol {
    func cellWasTapped(at indexPath: IndexPath) {
        guard let locationsViewModel = locationsViewModel else { return }
        
        let location = locationsViewModel.locations[indexPath.row]
        router.openWikipediaAppFor(latitude: location.latitude, longitude: location.longitude)
    }
    
    func takeMeThereButtonWasTapped(latitude: Double?, longitude: Double?) {
        guard let latitude = latitude, let longitude = longitude else {
            return
        }
        
        router.openWikipediaAppFor(latitude: latitude, longitude: longitude)
    }
}
