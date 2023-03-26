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
}

class HomePresenter: HomePresenterProtocol {
    private let interactor: HomeInteractorProtocol
    private let router: HomeRouterProtocol
    
    weak var view: HomeViewProtocol?
    
    init(interactor: HomeInteractorProtocol,
         router: HomeRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func viewIsReady() {
        view?.showLoader()
        getLocations()
    }
    
    private func getLocations() {
        interactor.getLocations() { [weak self] result in
            self?.view?.hideLoader()
            switch result {
            case .success(let locationsViewModel):
                self?.view?.displayLocations(locationsViewModel)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
