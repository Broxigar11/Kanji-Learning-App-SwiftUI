//
//  MeaningModel.swift
//  Kanji Learning App
//
//  Created by Admin on 2024. 10. 09..
//

import Foundation

struct Meaning {
    let english: String
    let hungarian: String
    let isPrimary: Bool

    init(english: String, hungarian: String, isPrimary: Bool = false) {
        self.english = english
        self.hungarian = hungarian
        self.isPrimary = isPrimary
    }
}
