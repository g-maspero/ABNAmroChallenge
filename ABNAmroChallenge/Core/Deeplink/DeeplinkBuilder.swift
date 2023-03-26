//
//  DeeplinkBuilder.swift
//  ABNAmroChallenge
//
//  Created by angst on 27/03/2023.
//

import Foundation

protocol BaseDeeplinkBuilderProtocol {
    func build() -> URL?
    func clean()
}

protocol DeeplinkBuilderProtocol: BaseDeeplinkBuilderProtocol {
    func with(scheme: String) -> Self
    func with(host: String) -> Self
    func with(path: String) -> Self
    @discardableResult
    func with(queryParamKey: String, queryParamValue: String) -> Self
}

class DeeplinkBuilder: DeeplinkBuilderProtocol {
    private var scheme: String?
    private var host: String?
    private var path: String?
    private var queryParams: [String: String] = [:]
    
    func with(scheme: String) -> Self {
        self.scheme = scheme
        return self
    }
    
    func with(host: String) -> Self {
        self.host = host
        return self
    }
    
    func with(path: String) -> Self {
        self.path = path
        return self
    }
    
    func with(queryParamKey: String, queryParamValue: String) -> Self {
        queryParams[queryParamKey] = queryParamValue
        return self
    }
    
    func build() -> URL? {
        defer { clean() }
        guard let scheme = scheme else { return nil }
        
        let urlString = "\(scheme)://\(hostString)\(pathString)\(queryString)"
        return URL(string: urlString)
    }
    
    func clean() {
        scheme = nil
        host = nil
        path = nil
        queryParams = [:]
    }
    
    private var hostString: String {
        return host ?? ""
    }
    
    private var pathString: String {
        guard let path = path else { return "" }
        
        return "/\(path)"
    }
    
    private var queryString: String {
        guard !queryParams.isEmpty else { return "" }
        
        let queryItems = queryParams.map { key, value in
            return "\(key)=\(value)"
        }
        
        return "?\(queryItems.joined(separator: "&"))"
    }
}
