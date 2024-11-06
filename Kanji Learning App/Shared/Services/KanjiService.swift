//
//  KanjiService.swift
//  Kanji Learning App
//
//  Created by Admin on 2024. 11. 01..
//

import Foundation
import Combine

class KanjiService {
    private let apiService: APIService
    private let baseURL = "/kanji"
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func fetchKanjiPage(page: Int = 0, pageSize: Int = 10) -> AnyPublisher<[Kanji], Error> {
        let parameters = [
            "page": "\(page)",
            "pageSize": "\(pageSize)"
        ]
        return apiService.get(endpoint: "\(self.baseURL)/page", parameters: parameters)
    }
    
    func searchKanjiPage(page: Int = 0, pageSize: Int = 10, searchTerm: String) -> AnyPublisher<[Kanji], Error> {
        let parameters = [
            "page": "\(page)",
            "pageSize": "\(pageSize)"
        ]
        return apiService.get(endpoint: "\(self.baseURL)/page/\(searchTerm)", parameters: parameters)
    }
    
}
