//
//  APIService.swift
//  Kanji Learning App
//
//  Created by Admin on 2024. 10. 30..
//

import Foundation
import Combine

class APIService {
    let baseURL: String

    init(baseURL: String = "https://broxigar.hopto.org:8082/api") {
        self.baseURL = baseURL
    }
    
    func get<T: Decodable>(endpoint: String, parameters: [String: String] = [:]) -> AnyPublisher<T, Error> {
            var components = URLComponents(string: "\(baseURL)/\(endpoint)")!
            components.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
            
            var request = URLRequest(url: components.url!)
            request.httpMethod = "GET"
            
            return perform(request: request)
        }
        
        func post<T: Decodable, U: Encodable>(endpoint: String, body: U) -> AnyPublisher<T, Error> {
            let url = URL(string: "\(baseURL)/\(endpoint)")!
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = try? JSONEncoder().encode(body)
            
            return perform(request: request)
        }
        
        func put<T: Decodable, U: Encodable>(endpoint: String, body: U) -> AnyPublisher<T, Error> {
            let url = URL(string: "\(baseURL)/\(endpoint)")!
            var request = URLRequest(url: url)
            request.httpMethod = "PUT"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = try? JSONEncoder().encode(body)
            
            return perform(request: request)
        }
        
        func delete<T: Decodable>(endpoint: String) -> AnyPublisher<T, Error> {
            let url = URL(string: "\(baseURL)/\(endpoint)")!
            var request = URLRequest(url: url)
            request.httpMethod = "DELETE"
            
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
