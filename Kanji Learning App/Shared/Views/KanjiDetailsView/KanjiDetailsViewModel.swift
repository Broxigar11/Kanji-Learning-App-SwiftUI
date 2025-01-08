//
//  KanjiDetailsViewModel.swift
//  Kanji Learning App
//
//  Created by Admin on 2024. 10. 20..
//

import Foundation
import Combine

class KanjiDetailsViewModel: ObservableObject {
    @Published var kanjiDetails: KanjiDetails?
    
    private let kanjiDetailsService: KanjiDetailsServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(kanjiDetailsService: KanjiDetailsServiceProtocol) {
        self.kanjiDetailsService = kanjiDetailsService
    }
    
    func fetchDetails(for kanji: Kanji?) {
        guard kanji != nil else { return }
        
        kanjiDetailsService.fetchKanjiDetails(of: kanji!.name)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { completion in
                    if case .failure(let error) = completion {
                        print("Error fetching kanji details: \(error)")
                    }
                },
                receiveValue: { [weak self] details in
                    self?.kanjiDetails = details
                }
            )
            .store(in: &cancellables)
    }
}
