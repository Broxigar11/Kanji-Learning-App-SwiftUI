//
//  ReadingModel.swift
//  Kanji Learning App
//
//  Created by Admin on 2024. 10. 09..
//

import Foundation

public enum ReadingType: String, Encodable, Decodable {
    case on = "ON"
    case kun = "KUN"
}

public enum ReadingFrequency: String, Encodable, Decodable {
    case rare = "RARE"
    case uncommon = "UNCOMMON"
    case common = "COMMON"
}

public struct Reading: Identifiable, Codable {
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
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(UUID.self, forKey: .id) ?? UUID()
        self.romanization = try container.decode(String.self, forKey: .romanization)
        self.type = try container.decode(ReadingType.self, forKey: .type)
        self.frequency = try container.decode(ReadingFrequency.self, forKey: .frequency)
        self.vocabulary = try container.decode([VocabularyEntry].self, forKey: .vocabulary)
    }
}

