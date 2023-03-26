//
//  LocationsViewMapper.swift
//  ABNAmroChallenge
//
//  Created by angst on 26/03/2023.
//

import Foundation

protocol LocationsViewMapperProtocol {
    func map(locationsDTO: LocationsDTO) -> LocationsViewModel
}

class LocationsViewMapper: LocationsViewMapperProtocol {
    func map(locationsDTO: LocationsDTO) -> LocationsViewModel {
        let locations = locationsDTO.locations.map({ map(locationDTO: $0) })
        return LocationsViewModel(locations: locations)
    }
    
    private func map(locationDTO: LocationDTO) -> LocationViewModel {
        let name = locationDTO.name ?? HomeWording.UnknownLocationName
        let latitude = locationDTO.latitude
        let longitude = locationDTO.longitude
        
        return LocationViewModel(name: name,
                                 latitude: latitude,
                                 longitude: longitude)
    }
}
