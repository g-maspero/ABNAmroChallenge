//
//  WikipediaPlacesDeeplinkBuilder.swift
//  ABNAmroChallenge
//
//  Created by angst on 26/03/2023.
//

import Foundation

protocol WikipediaPlacesDeeplinkBuilderProtocol: DeeplinkBuilderProtocol {
    func with(latitude: Double) -> Self
    func with(longitude: Double) -> Self
}

class WikipediaPlacesDeeplinkBuilder: WikipediaPlacesDeeplinkBuilderProtocol {
    private let wikipediaDeeplinkBuilder: WikipediaDeeplinkBuilderProtocol
    
    private var latitude: Double?
    private var longitude: Double?
    
    init(wikipediaDeeplinkBuilder: WikipediaDeeplinkBuilderProtocol) {
        self.wikipediaDeeplinkBuilder = wikipediaDeeplinkBuilder
    }
    
    func with(latitude: Double) -> Self {
        self.latitude = latitude
        return self
    }
    
    func with(longitude: Double) -> Self {
        self.longitude = longitude
        return self
    }
    
    func build() -> URL? {
        defer { clean() }
        
        guard let latitude = latitude,
              let longitude = longitude else { return nil }
        
        return wikipediaDeeplinkBuilder.with(page: .places)
                                       .with(queryParamKey: "lat", queryParamValue: String(latitude))
                                       .with(queryParamKey: "lon", queryParamValue: String(longitude))
                                       .build()
    }
    
    func clean() {
        latitude = nil
        longitude = nil
    }
}
