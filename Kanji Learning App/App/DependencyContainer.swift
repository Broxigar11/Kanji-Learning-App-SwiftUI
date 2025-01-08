//
//  DependencyContainer.swift
//  Kanji Learning App
//
//  Created by Admin on 2024. 10. 30..
//

import Foundation
import SwiftUI

final class DependencyContainer: ObservableObject {
    var userManager: UserManager
    var authManager: AuthManager
    
    private let userService: UserServiceProtocol
    private let authService: AuthServiceProtocol
    private let kanjiService: KanjiServiceProtocol
    private let kanjiDetailsService: KanjiDetailsServiceProtocol
    private let reviewingService: ReviewingServiceProtocol
    
    init(apiService: APIService = APIService()) {
        self.kanjiService = KanjiService(apiService: apiService)
        
        self.userService = UserService(apiService: apiService)
        self.authService = AuthService(apiService: apiService)
        self.kanjiDetailsService = KanjiDetailsService(apiService: apiService)
        self.reviewingService = ReviewingService(apiService: apiService)
        
        self.userManager = UserManager(userService: self.userService)
        self.authManager = AuthManager(userManager: self.userManager, authService: self.authService)
    }
    
    func makeHomeViewModel() -> HomeViewModel {
        HomeViewModel()
    }
    
    func makeLibraryViewModel() -> LibraryViewModel {
        LibraryViewModel(kanjiService: self.kanjiService)
    }
    
    func makeLearningViewModel() -> HomeViewModel {
        HomeViewModel()
    }
    
    func makeKanjiDetailsViewModel() -> KanjiDetailsViewModel {
        KanjiDetailsViewModel(kanjiDetailsService: self.kanjiDetailsService)
    }
    
    func makeReviewingViewModel() -> ReviewingViewModel {
        guard let kanji = userManager.nextKanjiToReview else {
            fatalError("nextKanjiToReview should never be nil when creating ReviewingViewModel")
        }
        
        return ReviewingViewModel(reviewingService: self.reviewingService, kanji: kanji)
    }
}
