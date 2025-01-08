//
//  APIService.swift
//  Kanji Learning App
//
//  Created by Admin on 2024. 10. 30..
//

import Foundation
import Combine

class APIService: APIServiceProtocol {
    let baseURL: String

//    init(baseURL: String = "https://broxigar.hopto.org:8082/api") {
    init(baseURL: String = "http://192.168.100.17:8082/api") {
        self.baseURL = baseURL
    }
    
    func request<T: Decodable>(
        endpoint: String,
        method: HTTPMethod,
        parameters: [String: String] = [:]
    ) -> AnyPublisher<T, Error> {
        var components = URLComponents(string: "\(baseURL)\(endpoint)")!
        components.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        
        var request = URLRequest(url: components.url!)
        request.httpMethod = method.rawValue
        
        return perform(request: request)
    }
    
    func request<T: Decodable, U: Encodable>(
        endpoint: String,
        method: HTTPMethod,
        body: U,
        parameters: [String: String] = [:]
    ) -> AnyPublisher<T, Error> {
        var components = URLComponents(string: "\(baseURL)\(endpoint)")!
        components.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        
        var request = URLRequest(url: components.url!)
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        
        return perform(request: request)
    }
    
    private func perform<T: Decodable>(request: URLRequest) -> AnyPublisher<T, Error> {
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
