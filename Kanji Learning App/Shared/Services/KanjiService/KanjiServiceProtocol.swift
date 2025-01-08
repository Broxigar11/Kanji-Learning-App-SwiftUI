//
//  KanjiServiceProtocol.swift
//  Kanji Learning App
//
//  Created by David Karafa on 07/01/2025.
//

import Combine

protocol KanjiServiceProtocol {
    
    func fetchKanjiPage(page: Int, pageSize: Int) -> AnyPublisher<[Kanji], Error>
    
    func searchKanjiPage(page: Int, pageSize: Int, searchTerm: String) -> AnyPublisher<[Kanji], Error>
    
}
