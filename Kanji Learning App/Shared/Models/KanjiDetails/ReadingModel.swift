//
//  ReadingModel.swift
//  Kanji Learning App
//
//  Created by Admin on 2024. 10. 09..
//

import Foundation

public enum ReadingType: String, Encodable, Decodable {
    case on
    case kun
}

public enum ReadingFrequency: String, Encodable, Decodable {
    case rare
    case uncommon
    case common
}

public struct Reading: Identifiable, Encodable, Decodable {
    public let id: UUID?
    public let romanization: String
    public let type: ReadingType
    public let frequency: ReadingFrequency
    public let vocabulary: [VocabularyEntry]
    
    init(id: UUID? = UUID(), romanization: String, type: ReadingType, frequency: ReadingFrequency, vocabulary: [VocabularyEntry]) {
        self.id = id
        self.romanization = romanization
        self.type = type
        self.frequency = frequency
        self.vocabulary = vocabulary
    }
}

