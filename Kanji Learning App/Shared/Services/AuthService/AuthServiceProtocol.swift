//
//  AuthServiceProtocol.swift
//  Kanji Learning App
//
//  Created by David Karafa on 07/01/2025.
//

import Combine

protocol AuthServiceProtocol {
    
    func login(username: String, password: String) -> AnyPublisher<User, Error> 
    
}
