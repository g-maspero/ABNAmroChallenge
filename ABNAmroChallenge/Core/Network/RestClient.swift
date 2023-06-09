//
//  RestClient.swift
//  ABNAmroChallenge
//
//  Created by angst on 26/03/2023.
//

import Foundation

protocol RestClientProtocol {
    associatedtype DTO: Codable
    func get(_ url: String, params: [String: Any]?, onCompletion completionHandler: @escaping (Result<DTO, Error>) -> Void)
    func put(_ url: String, params: [String: Any]?, onCompletion completionHandler: @escaping (Result<DTO, Error>) -> Void)
    func post(_ url: String, params: [String: Any]?, onCompletion completionHandler: @escaping (Result<DTO, Error>) -> Void)
}

class RestClient<DTO: Codable>: RestClientProtocol {
    private let httpManager: HTTPManagerProtocol
    
    init(httpManager: HTTPManagerProtocol) {
        self.httpManager = httpManager
    }
    
    func get(_ url: String, params: [String: Any]?, onCompletion completionHandler: @escaping (Result<DTO, Error>) -> Void) {
        httpManager.get(url,
                        params: params,
                        onCompletion: parseResponse(withCompletionHandler: completionHandler))
    }
    
    func put(_ url: String, params: [String: Any]?, onCompletion completionHandler: @escaping (Result<DTO, Error>) -> Void) {
        httpManager.put(url,
                        params: params,
                        onCompletion: parseResponse(withCompletionHandler: completionHandler))
    }
    
    func post(_ url: String, params: [String: Any]?, onCompletion completionHandler: @escaping (Result<DTO, Error>) -> Void) {
        httpManager.post(url,
                        params: params,
                        onCompletion: parseResponse(withCompletionHandler: completionHandler))
    }
    
    private func parseResponse(withCompletionHandler completionHandler: @escaping (Result<DTO, Error>) -> Void) -> (Result<Data, Error>) -> Void {
        return { (result: Result<Data, Error>) in
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .useDefaultKeys
                    let dto = try decoder.decode(DTO.self, from: data)
                    completionHandler(.success(dto))
                } catch {
                    completionHandler(.failure(error))
                }
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
