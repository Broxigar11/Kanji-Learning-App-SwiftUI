//
//  KanjiDetailsModel.swift
//  Kanji Learning App
//
//  Created by Admin on 2024. 10. 19..
//

import Foundation

public struct KanjiDetails {
    public let id: Int
    public let character: Character
    public let name: String
    public let strokeCount: Int
    public let orderNumber: Int
    public let mnemonic: String?
    public let composition: [Kanji]
    public let onyomi: [Reading]
    public let kunyomi: [Reading]
    public let note: String?
    public let nextReviewDate: Date?
}
