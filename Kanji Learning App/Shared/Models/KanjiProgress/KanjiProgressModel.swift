//
//  KanjiProgress.swift
//  Kanji Learning App
//
//  Created by David Karafa on 05/01/2025.
//

import Foundation

struct KanjiProgress: Codable {
    public let kanjiDetails: KanjiDetails
    public var reviewStreak: UInt8
    public var nextReviewDate: Date
}
