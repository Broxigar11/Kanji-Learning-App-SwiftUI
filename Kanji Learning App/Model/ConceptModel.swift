//
//  ConceptModel.swift
//  Kanji Learning App
//
//  Created by Admin on 2024. 09. 09..
//

import Foundation

struct Concept {
    let meanings: [Meaning]
    let readings: [Reading]
    let isPrimary: Bool
    let primaryMeaning: Meaning
    let primaryReading: Reading
    
    init(meanings: [Meaning], readings: [Reading], isPrimary: Bool = false) throws {
        guard !meanings.isEmpty else {
            throw ConceptError.noMeaningsProvided
        }
        
        guard !readings.isEmpty else {
            throw ConceptError.noReadingsProvided
        }
        
        let primaryMeanings = meanings.filter { $0.isPrimary }
        guard primaryMeanings.count == 1 else {
            if primaryMeanings.isEmpty {
                throw ConceptError.noPrimaryMeaning
            } else {
                throw ConceptError.multiplePrimaryMeanings
            }
        }
        
        let primaryReadings = readings.filter { $0.isPrimary }
        guard primaryReadings.count == 1 else {
            if primaryReadings.isEmpty {
                throw ConceptError.noPrimaryReading
            } else {
                throw ConceptError.multiplePrimaryReadings
            }
        }
        
        self.meanings = meanings
        self.readings = readings
        self.isPrimary = isPrimary
        self.primaryMeaning = primaryMeanings.first!
        self.primaryReading = primaryReadings.first!
    }
}

enum ConceptError: Error {
    case noMeaningsProvided
    case noReadingsProvided
    case noPrimaryMeaning
    case multiplePrimaryMeanings
    case noPrimaryReading
    case multiplePrimaryReadings
}

