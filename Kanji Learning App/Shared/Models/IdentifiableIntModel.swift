//
//  File.swift
//  Kanji Learning App
//
//  Created by Admin on 2024. 10. 20..
//

public struct IdentifiableInt: Identifiable {
    public var id: Int
    
    public init(_ id: Int) {
        self.id = id
    }
}
