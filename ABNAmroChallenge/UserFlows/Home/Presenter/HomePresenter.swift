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
                self?.view?.presentOKAlert(title: CoreWording.GenericErrorTitle,
                                     message: error.localizedDescription)
            }
        }
    }
    
    private func openWikipediaFor(latitude: Double, longitude: Double) {
        let deeplinkSuccessfullyOpened = router.openWikipediaAppFor(latitude: latitude, longitude: longitude)
        if !deeplinkSuccessfullyOpened {
            view?.presentOKAlert(title: CoreWording.GenericErrorTitle, message: CoreWording.OpenDeeplinkError)
        }
    }
}

extension HomePresenter: HomePresenterProtocol {
    func cellWasTapped(at indexPath: IndexPath) {
        guard let locationsViewModel = locationsViewModel else { return }
        
        let location = locationsViewModel.locations[indexPath.row]
        openWikipediaFor(latitude: location.latitude, longitude: location.longitude)
    }
    
    func takeMeThereButtonWasTapped(latitude: Double?, longitude: Double?) {
        guard let latitude = latitude, let longitude = longitude else {
            view?.presentOKAlert(title: CoreWording.Oops,
                                 message: HomeWording.CoordinatesErrorTitle)
            return
        }
        openWikipediaFor(latitude: latitude, longitude: longitude)
    }
}
