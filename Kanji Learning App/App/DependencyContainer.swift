//
//  DependencyContainer.swift
//  Kanji Learning App
//
//  Created by Admin on 2024. 10. 30..
//

import Foundation
import SwiftUI

final class DependencyContainer: ObservableObject {
    let apiService: APIService = APIService()
    let kanjiService: KanjiService
    let kanjiDetailsService: KanjiDetailsService
    
    init() {
        kanjiService = KanjiService(apiService: self.apiService)
        kanjiDetailsService = KanjiDetailsService(apiService: self.apiService)
    }
    
    func makeHomeViewModel() -> HomeViewModel {
        HomeViewModel()
    }
    
    func makeLibraryViewModel() -> LibraryViewModel {
        LibraryViewModel(kanjiService: self.kanjiService)
    }
    
    func makeLearningViewModel() -> HomeViewModel {
        HomeViewModel()
    }
    
    func makeKanjiDetailsViewModel() -> KanjiDetailsViewModel {
        KanjiDetailsViewModel(kanjiDetailsService: self.kanjiDetailsService)
    }
}
