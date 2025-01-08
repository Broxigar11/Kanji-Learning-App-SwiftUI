//
//  UserModel.swift
//  Kanji Learning App
//
//  Created by Admin on 2024. 10. 20..
//


import Foundation

public struct User: Codable {
    public let username: String
    public let progress: UserProgress
    public let preferences: UserPreferences
}
