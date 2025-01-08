//
//  ReviewingServiceProtocol.swift
//  Kanji Learning App
//
//  Created by David Karafa on 07/01/2025.
//

import Combine

protocol ReviewingServiceProtocol {
    
    func fetchKanjiProgress(of name: String) -> AnyPublisher<KanjiProgress, Error>
    
}
