//
//  LibraryView.swift
//  Kanji Learning App
//
//  Created by Admin on 2024. 10. 14..
//

import SwiftUI

struct LibraryView: View {
    @EnvironmentObject private var container: DependencyContainer
    @StateObject var viewModel: LibraryViewModel
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil)
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(viewModel.kanjiList) { kanji in
                    GeometryReader { geometry in
                        Button(action: {
                            viewModel.showDetails(of: kanji)
                        }) {
                            VStack {
                                Text(kanji.character)
                                    .font(.largeTitle)
                                    .padding(.bottom, 8)
                                Text(kanji.name)
                                    .font(.body)
                            }
                            .frame(width: geometry.size.width, height: geometry.size.width)
                            .background(Color.white)
                            .border(Color.black, width: 2)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    .aspectRatio(1, contentMode: .fit)
                }
                
                if viewModel.isLoading {
                    ProgressView()
                } else {
                    Color.clear
                        .onAppear {
                            viewModel.loadMoreKanjiIfNeeded()
                        }
                }
            }
        }
        .onAppear {
            viewModel.loadInitialKanji()
        }
        .sheet(isPresented: ($viewModel.showDetailsSheet), content: {
            KanjiDetailsView(viewModel: container.makeKanjiDetailsViewModel(), kanji: $viewModel.kanjiDetails)
        })
    }
}
