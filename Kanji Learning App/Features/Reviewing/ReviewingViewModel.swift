//
//  ReviewingViewModel.swift
//  Kanji Learning App
//
//  Created by David Karafa on 06/01/2025.
//

import SwiftUI
import Combine

public class ReviewingViewModel: ObservableObject {
    @Published var review: Review?
    @Published var isLoading = false
    
    private let reviewingService: ReviewingServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    private var questions: [Quiz] = []
    
    init(reviewingService: ReviewingServiceProtocol, kanji: Kanji) {
        self.reviewingService = reviewingService
        loadReview(of: kanji)
    }
    
    private func loadReview(of kanji: Kanji) {
        isLoading = true
        fetchProgress(of: kanji)
    }
    
    private func fetchProgress(of kanji: Kanji) {
        reviewingService.fetchKanjiProgress(of: kanji.name)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { completion in
                    if case .failure(let error) = completion {
                        print("Error fetching kanji progress: \(error)")
                    }
                },
                receiveValue: { [weak self] progress in
                    //do something with the data
                }
            )
            .store(in: &cancellables)
    }
}
