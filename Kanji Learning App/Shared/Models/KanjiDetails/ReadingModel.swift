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

public struct Reading: Encodable, Decodable {
    public let romanization: String
    public let type: ReadingType
    public let frequency: ReadingFrequency
    public let vocabulary: [VocabularyEntry]
}

