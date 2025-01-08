//
//  UserProgressModel.swift
//  Kanji Learning App
//
//  Created by David Karafa on 05/01/2025.
//

import Foundation

public struct UserProgress: Codable {
    var level: UserLevel
    var nextKanji: Kanji
    var kanjiReviewList: [Kanji]
    var isLearningInProgress: Bool
}

public enum UserLevel: Int, Codable {
    case beginner = 1
    case intermediate = 2
    case advanced = 3
}
