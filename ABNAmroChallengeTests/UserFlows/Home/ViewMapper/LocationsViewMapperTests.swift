//
//  LocationsViewMapperTests.swift
//  ABNAmroChallengeTests
//
//  Created by angst on 27/03/2023.
//

import XCTest
@testable import ABNAmroChallenge

class LocationsViewMapperTests: XCTestCase {
    func testMap() {
        //given
        let sut = LocationsViewMapper()
        let name = "name"
        let latitude: Double = 50
        let longitude: Double = 70
        let locationDTO = LocationDTO(name: name,
                                      latitude: latitude,
                                      longitude: longitude)
        let locationsDTO = LocationsDTO(locations: [locationDTO])
        
        //when
        let locationsViewModel = sut.map(locationsDTO: locationsDTO)
        
        //then
        XCTAssertEqual(locationsViewModel.locations.count, locationsDTO.locations.count)
        XCTAssertEqual(locationsViewModel.locations.first!.name, name)
        XCTAssertEqual(locationsViewModel.locations.first!.latitude, latitude)
        XCTAssertEqual(locationsViewModel.locations.first!.longitude, longitude)
    }
}
