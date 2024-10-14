//
//  ReadingModel.swift
//  Kanji Learning App
//
//  Created by Admin on 2024. 10. 09..
//

import Foundation

enum ReadingType {
    case onyomi
    case kunyomi
}

struct Reading {
    let type: ReadingType
    let kana: String
    let romanization: String
    let pronunciationHint: String?
    let isPrimary: Bool

    init(type: ReadingType, kana: String, romanization: String, pronunciationHint: String? = nil, isPrimary: Bool = false) {
        self.type = type
        self.kana = kana
        self.romanization = romanization
        self.pronunciationHint = pronunciationHint
        self.isPrimary = isPrimary
    }
}

