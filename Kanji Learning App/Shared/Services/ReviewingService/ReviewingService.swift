//
//  ReviewingService.swift
//  Kanji Learning App
//
//  Created by David Karafa on 06/01/2025.
//

import Foundation
import Combine

class ReviewingService: ReviewingServiceProtocol {
    private let apiService: APIServiceProtocol
    private let baseURL = "/kanji/progress"
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func fetchKanjiProgress(of name: String) -> AnyPublisher<KanjiProgress, Error> {
        let mockProgress = KanjiProgress(
            kanjiDetails: KanjiDetails(
                character: "皆",
                name: "Everyone",
                strokeCount: 9,
                mnemonic: "",
                orderNumber: 26,
                components: [
                    Kanji(
                        character: "比",
                        name: "Compare"
                    ),
                    Kanji(
                        character: "白",
                        name: "White"
                    )
                ],
                usedInCompositions: [],
                readings: [
                    Reading(
                        romanization: "kai",
                        type: ReadingType.on,
                        frequency: ReadingFrequency.common,
                        vocabulary: [
                            VocabularyEntry(
                                word: "皆無",
                                meanings: "nonexistent; none at all"
                            )
                        ]
                    ),
                    Reading(
                        romanization: "minna",
                        type: ReadingType.kun,
                        frequency: ReadingFrequency.common,
                        vocabulary: [
                            VocabularyEntry(
                                word: "皆",
                                meanings: "everyone; all"
                            )
                        ]
                    )
                ]
            ),
            reviewStreak: 2,
            nextReviewDate: Date.distantPast
        )

        return Just(mockProgress)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
}
