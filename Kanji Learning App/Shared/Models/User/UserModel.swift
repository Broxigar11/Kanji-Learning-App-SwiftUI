//
//  UserModel.swift
//  Kanji Learning App
//
//  Created by Admin on 2024. 10. 20..
//


/*
 ez az egész gondolom nem így kéne hogy legyen, mert a struct elvileg immutable,
 újragenerálja az egész objectet mikor megváltoztatod.
 és majd a settingsView-ban állíthatóvá akarom rakni az összeset
 szóval ez egy ViewModel kellene hogy legyen?
 vagy mi a rákot kellene ezzel csinálnom ha model nem kéne hogy class legyen? xd
 */
import Foundation

public struct User {
    public var username: String
    public var lastLearnedKanjiNumber: Int
    public var scriptType: ScriptType
    public var level: UserLevel
    
    
}

public enum UserLevel: Int {
    case beginner = 1
    case intermediate = 2
    case advanced = 3
}

public enum ScriptType: Int {
    case romaji = 1
    case hiragana = 2
    case katakana = 3
}
