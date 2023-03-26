//
//  LocationsViewModel.swift
//  ABNAmroChallenge
//
//  Created by angst on 26/03/2023.
//

import UIKit

struct LocationsViewModel {
    let locations: [LocationViewModel]
}

struct LocationViewModel {
    let name: String
    let latitude: Double
    let longitude: Double
}
