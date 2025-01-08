//
//  APIServiceProtocol.swift
//  Kanji Learning App
//
//  Created by Admin on 2024. 10. 30..
//

import Combine
	
protocol APIServiceProtocol {
    
    func request<T: Decodable>(
        endpoint: String,
        method: HTTPMethod,
        parameters: [String: String]
    ) -> AnyPublisher<T, Error>
    
    func request<T: Decodable, U: Encodable>(
        endpoint: String,
        method: HTTPMethod,
        body: U?,
        parameters: [String: String]
    ) -> AnyPublisher<T, Error>
    
}
