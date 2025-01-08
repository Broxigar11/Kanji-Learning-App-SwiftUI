//
//  AuthManager.swift
//  Kanji Learning App
//
//  Created by David Karafa on 07/01/2025.
//

import Foundation
import SwiftUICore
import Combine

class AuthManager: ObservableObject {
    private let userManager: UserManager
    private let authService: AuthServiceProtocol
    private var cancellables = Set<AnyCancellable>()

    init(userManager: UserManager, authService: AuthServiceProtocol) {
        self.userManager = userManager
        self.authService = authService
    }
    
    func login(username: String = "", password: String = "") {
        authService.login(username: username, password: password)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { completion in
                    if case .failure(let error) = completion {
                        print("Error logging in: \(error)")
                    }
                },
                receiveValue: { [weak self] user in
                    self?.userManager.loadUser(user: user)
                }
            )
            .store(in: &cancellables)
    }
}
