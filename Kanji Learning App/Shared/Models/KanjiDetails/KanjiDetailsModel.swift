//
//  KanjiDetailsModel.swift
//  Kanji Learning App
//
//  Created by Admin on 2024. 10. 19..
//

import Foundation

public struct KanjiDetails: Codable {
    public let character: String
    public let name: String
    public let strokeCount: Int
    public let mnemonic: String?
    public let orderNumber: Int
    public let components: [Kanji]
    public let usedInCompositions: [Kanji]
    public let readings: [Reading]
}
