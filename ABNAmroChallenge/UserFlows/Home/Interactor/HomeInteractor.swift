//
//  HomeInteractor.swift
//  ABNAmroChallenge
//
//  Created by angst on 26/03/2023.
//

import Foundation

protocol HomeInteractorProtocol {
    func getLocations(onCompletion completionHandler: @escaping (Result<LocationsViewModel, Error>) -> Void)
}

class HomeInteractor: HomeInteractorProtocol {
    private let locationRepository: LocationRepositoryProtocol
    private let viewMapper: LocationsViewMapperProtocol
    
    init(locationRepository: LocationRepositoryProtocol, viewMapper: LocationsViewMapperProtocol) {
        self.locationRepository = locationRepository
        self.viewMapper = viewMapper
    }
    
    func getLocations(onCompletion completionHandler: @escaping (Result<LocationsViewModel, Error>) -> Void) {
        locationRepository.getLocations { [weak self] result in
            guard let self = self else { completionHandler(.failure(ErrorType.weakSelf)); return }
            
            switch result {
            case .success(let locationsDTO):
                completionHandler(.success(self.viewMapper.map(locationsDTO: locationsDTO)))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
