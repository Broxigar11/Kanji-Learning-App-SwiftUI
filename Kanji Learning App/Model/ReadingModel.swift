//
//  ReadingModel.swift
//  Kanji Learning App
//
//  Created by Admin on 2024. 10. 09..
//

import Foundation

public enum ReadingType {
    case onyomi
    case kunyomi
}

public enum ReadingFrequency: Int {
    case rare = 1
    case uncommon = 2
    case common = 3
}

public struct Reading {
    public let type: ReadingType
    public let romanization: String
    public let frequency: ReadingFrequency
    public let vocabulary: [VocabularyEntry]
}

