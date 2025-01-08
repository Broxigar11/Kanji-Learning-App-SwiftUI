//
//  UserPreferencesModel.swift
//  Kanji Learning App
//
//  Created by David Karafa on 05/01/2025.
//

import Foundation

public struct UserPreferences: Codable {
    public var scriptType: ScriptType
}

public enum ScriptType: Int, Codable {
    case romaji = 1
    case hiragana = 2
    case katakana = 3
}
