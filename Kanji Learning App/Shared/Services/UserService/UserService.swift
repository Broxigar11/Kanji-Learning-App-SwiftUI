//
//  Untitled.swift
//  Kanji Learning App
//
//  Created by David Karafa on 06/01/2025.
//

import Foundation
import Combine

class UserService: UserServiceProtocol {
    private let apiService: APIServiceProtocol
    private let baseURL = "/user"
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func fetchUserProgress(of username: String) -> AnyPublisher<UserProgress, Error> {
        let mockProgress = UserProgress(
            level: UserLevel.beginner,
            nextKanji: Kanji(character: "永", name: "Eternity"),
            kanjiReviewList: [
                Kanji(character: "白", name: "White"),
                Kanji(character: "皆", name: "Everyone"),
                Kanji(character: "水", name: "Water")
            ],
            isLearningInProgress: false
        )

        return Just(mockProgress)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
}
