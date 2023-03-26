//
//  LocationRepository.swift
//  ABNAmroChallenge
//
//  Created by angst on 26/03/2023.
//

import Foundation

protocol LocationRepositoryProtocol {
    func getLocations(onCompletion completionHandler: @escaping (Result<LocationsDTO, Error>) -> Void)
}

class LocationRepository: LocationRepositoryProtocol {
    func getLocations(onCompletion completionHandler: @escaping (Result<LocationsDTO, Error>) -> Void) {
        let locationsUrl: String = "https://raw.githubusercontent.com/abnamrocoesd/assignment-ios/main/locations.json"
        //Clean Architecture Proposal: This could be furhter decoupled by using a builder for RestClient
        RestClient<LocationsDTO>(httpManager: HTTPManager()).get(locationsUrl, params: nil) { result in
            switch result {
            case .success(let locationsDTO):
                completionHandler(.success(locationsDTO))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
