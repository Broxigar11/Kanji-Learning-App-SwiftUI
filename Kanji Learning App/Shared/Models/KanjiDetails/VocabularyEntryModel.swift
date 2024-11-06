//
//  VocabularyEntryModel.swift
//  Kanji Learning App
//
//  Created by Admin on 2024. 10. 20..
//

import Foundation

public struct VocabularyEntry: Identifiable, Encodable, Decodable {
    public let id: UUID?
    public let word: String
    public let meanings: String
    
    init(id: UUID = UUID(), word: String, meanings: String) {
        self.id = id
        self.word = word
        self.meanings = meanings
    }
}
