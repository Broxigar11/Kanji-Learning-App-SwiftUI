//
//  UserManager.swift
//  Kanji Learning App
//
//  Created by David Karafa on 05/01/2025.
//

import Foundation

class UserManager: ObservableObject {
    @Published var username: String?
    @Published var userProgress: UserProgress?
    @Published var userPreferences: UserPreferences?
    @Published var nextKanjiToLearn: Kanji?
    @Published var nextKanjiToReview: Kanji?
    @Published var isLoading: Bool = false
    
    private let userService: UserServiceProtocol
    
    init(userService: UserServiceProtocol) {
        self.userService = userService
    }
    
    func loadUser(user: User) {
        //set members
    }
    
}
