//
//  UserServiceProtocol.swift
//  Kanji Learning App
//
//  Created by David Karafa on 07/01/2025.
//

import Combine

protocol UserServiceProtocol {
    
    func fetchUserProgress(of username: String) -> AnyPublisher<UserProgress, Error>
    
}
