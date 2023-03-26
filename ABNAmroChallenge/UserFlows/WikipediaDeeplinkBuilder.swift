//
//  WikipediaDeeplinkBuilder.swift
//  ABNAmroChallenge
//
//  Created by angst on 26/03/2023.
//

import Foundation

protocol DeeplinkBuilderProtocol {
    func build() -> URL?
    func clean()
}

protocol WikipediaDeeplinkBuilderProtocol: DeeplinkBuilderProtocol {
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
    private let wikipediaBaseUrl = "wikipedia://"
    
    private var page: WikipediaPage = .places
    private var queryParams: [String: String] = [:]
    
    func with(page: WikipediaPage) -> Self {
        self.page = page
        return self
    }
    
    func with(queryParamKey: String, queryParamValue: String) -> Self {
        queryParams[queryParamKey] = queryParamValue
        return self
    }
    
    func build() -> URL? {
        defer { clean() }
        
        let urlString = "\(wikipediaBaseUrl)\(page.urlHost)?\(queryString)"
        
        return URL(string: urlString)
    }
    
    func clean() {
        queryParams = [:]
    }
    
    private var queryString: String {
        guard !queryParams.isEmpty else { return "" }
        
        let queryItems = queryParams.map { key, value in
            return "\(key)=\(value)"
        }
        
        return queryItems.joined(separator: "&")
    }
}
