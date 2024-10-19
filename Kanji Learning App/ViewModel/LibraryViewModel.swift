//
//  LibraryViewModel.swift
//  Kanji Learning App
//
//  Created by Admin on 2024. 10. 14..
//

import Foundation

class LibraryViewModel: ObservableObject {
    @Published var kanjiList: [Kanji] = []
    @Published var reviewQueue: [Kanji] = []
}
