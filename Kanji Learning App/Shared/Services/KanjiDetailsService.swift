//
//  KanjiDetailsService.swift
//  Kanji Learning App
//
//  Created by Admin on 2024. 11. 01..
//

import Foundation
import Combine

class KanjiDetailsService {
    private let apiService: APIService
    private let baseURL = "/kanji/details"
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func fetchKanjiDetails(of name: String) -> AnyPublisher<KanjiDetails, Error> {
        return apiService.get(endpoint: "\(self.baseURL)/\(name)")
    }
    
    func fetchNextKanjiDetails(by orderNumber: Int) -> AnyPublisher<KanjiDetails, Error> {
        return apiService.get(endpoint: "\(self.baseURL)/next\(orderNumber)")
    }
}
