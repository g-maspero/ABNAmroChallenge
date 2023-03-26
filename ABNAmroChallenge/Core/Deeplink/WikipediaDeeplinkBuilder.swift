//
//  WikipediaDeeplinkBuilder.swift
//  ABNAmroChallenge
//
//  Created by angst on 26/03/2023.
//

import Foundation

protocol WikipediaDeeplinkBuilderProtocol: BaseDeeplinkBuilderProtocol {
    func with(page: WikipediaPage) -> Self
    func with(queryParamKey: String, queryParamValue: String) -> Self
}

enum WikipediaPage {
    case places
    
    var urlHost: String {
        switch self {
        case .places: return "places"
        }
    }
}

class WikipediaDeeplinkBuilder: WikipediaDeeplinkBuilderProtocol {
    private let wikipediaScheme = "wikipedia"
    private var page: WikipediaPage = .places
    
    private let deeplinkBuilder: DeeplinkBuilderProtocol
    
    init(deeplinkBuilder: DeeplinkBuilderProtocol) {
        self.deeplinkBuilder = deeplinkBuilder
    }
    
    func with(page: WikipediaPage) -> Self {
        self.page = page
        return self
    }
    
    func with(queryParamKey: String, queryParamValue: String) -> Self {
        deeplinkBuilder.with(queryParamKey: queryParamKey, queryParamValue: queryParamValue)
        return self
    }
    
    func build() -> URL? {
        defer { clean() }
        
        return deeplinkBuilder.with(scheme: wikipediaScheme)
                              .with(host: page.urlHost)
                              .build()
    }
    
    func clean() {
        deeplinkBuilder.clean()
    }
}
