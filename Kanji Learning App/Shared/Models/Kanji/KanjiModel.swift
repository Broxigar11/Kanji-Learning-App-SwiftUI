//
//  KanjiModel.swift
//  Kanji Learning App
//
//  Created by Admin on 2024. 10. 09..
//

import Foundation

public struct Kanji: Identifiable, Encodable, Decodable, Equatable {
    public let id: UUID?
    public let character: String
    public let name: String
    
    public init(id: UUID? = UUID(), character: String, name: String) {
        self.id = id
        self.character = character
        self.name = name
    }
}
