//
//  LocationsDTO.swift
//  ABNAmroChallenge
//
//  Created by angst on 26/03/2023.
//

import Foundation

struct LocationsDTO: Codable {
    let locations: [LocationDTO]
}

struct LocationDTO: Codable {
    let name: String?
    let latitude: Double
    let longitude: Double
    
    private enum CodingKeys: String, CodingKey {
        case name
        case latitude = "lat"
        case longitude = "long"
    }
}
