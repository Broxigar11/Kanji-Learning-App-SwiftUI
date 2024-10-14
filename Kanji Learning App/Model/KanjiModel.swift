//
//  KanjiModel.swift
//  Kanji Learning App
//
//  Created by Admin on 2024. 09. 09..
//

import Foundation

struct Kanji {
    let character: Character
    let concepts: [Concept]
    let strokeCount: Int
    let jlptLevel: Int?
    let radicals: [String]
    let primaryConcept: Concept

    init(character: Character, concepts: [Concept], strokeCount: Int, jlptLevel: Int? = nil, radicals: [String] = []) throws {
        guard !concepts.isEmpty else {
            throw KanjiError.noConceptsProvided
        }
        
        guard strokeCount > 0 else {
            throw KanjiError.invalidStrokeCount
        }
        
        let primaryConcepts = concepts.filter { $0.isPrimary }
        guard primaryConcepts.count == 1 else {
            if primaryConcepts.isEmpty {
                throw KanjiError.noPrimaryConcept
            } else {
                throw KanjiError.multiplePrimaryConcepts
            }
        }
        
        self.character = character
        self.concepts = concepts
        self.strokeCount = strokeCount
        self.jlptLevel = jlptLevel
        self.radicals = radicals
        self.primaryConcept = primaryConcepts.first!
    }
}

enum KanjiError: Error {
    case noConceptsProvided
    case noPrimaryConcept
    case multiplePrimaryConcepts
    case invalidStrokeCount
}
