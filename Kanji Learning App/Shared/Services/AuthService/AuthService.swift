//
//  AuthService.swift
//  Kanji Learning App
//
//  Created by David Karafa on 07/01/2025.
//

import Combine

class AuthService: AuthServiceProtocol {
    private let apiService: APIServiceProtocol
    private let baseURL = "/user"
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func login(username: String, password: String) -> AnyPublisher<User, Error> {
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
        let mockPreferences = UserPreferences(scriptType: ScriptType.hiragana)
        
        let mockUser = User(username: "Broxigar", progress: mockProgress, preferences: mockPreferences)

        return Just(mockUser)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
}
