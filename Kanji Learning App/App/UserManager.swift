//
//  UserManager.swift
//  Kanji Learning App
//
//  Created by David Karafa on 05/01/2025.
//

import Combine

class UserManager: ObservableObject {
    @Published var username: String?
    @Published var userProgress: UserProgress? {
        didSet {
            findKanjiToReview()
        }
    }
    @Published var userPreferences: UserPreferences?
    @Published var nextKanjiToReview: Kanji?

    private let userService: UserServiceProtocol
    private var cancellables = Set<AnyCancellable>()

    init(userService: UserServiceProtocol) {
        self.userService = userService
        observeUserProgressChanges()
    }

    func loadUser(user: User) {
        self.username = user.username
        self.userProgress = user.progress
        self.userPreferences = user.preferences
    }

    func findKanjiToReview() {
        nextKanjiToReview = userProgress?.kanjiReviewList.first
    }

    private func observeUserProgressChanges() {
        $userProgress
            .compactMap { $0?.kanjiReviewList }
            .sink { [weak self] _ in
                self?.findKanjiToReview()
            }
            .store(in: &cancellables)
    }
}

