//
//  KanjiDetailsView.swift
//  Kanji Learning App
//
//  Created by Admin on 2024. 10. 20..
//

import SwiftUI

struct KanjiDetailsView: View {
    @StateObject var viewModel: KanjiDetailsViewModel
    @Binding var kanji: Kanji?

    var body: some View {
        VStack {
            if let details = viewModel.kanjiDetails {
                VStack {
                    Text(details.character)
                        .font(.largeTitle)
                    Text(details.name)
                        .font(.title3)
                    TabView {
                        
                    }
                }
            } else {
                ProgressView()
            }
        }
        .onAppear {
            viewModel.fetchDetails(for: kanji)
        }
        .onChange(of: kanji) { newKanji in
            viewModel.fetchDetails(for: newKanji)
        }
    }
}
