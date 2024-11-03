//
//  HomeViewModel.swift
//  Kanji Learning App
//
//  Created by Admin on 2024. 10. 14..
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var username: String = "Brox"
    @Published var learningQueue: [Kanji] = []
    @Published var reviewQueue: [Kanji] = []
}
