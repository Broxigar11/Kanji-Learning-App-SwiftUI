//
//  KanjiDetailsServiceProtocol.swift
//  Kanji Learning App
//
//  Created by David Karafa on 07/01/2025.
//

import Combine

protocol KanjiDetailsServiceProtocol {

    func fetchKanjiDetails(of name: String) -> AnyPublisher<KanjiDetails, Error>
    
    func fetchNextKanjiDetails(by orderNumber: Int) -> AnyPublisher<KanjiDetails, Error>
    
}
