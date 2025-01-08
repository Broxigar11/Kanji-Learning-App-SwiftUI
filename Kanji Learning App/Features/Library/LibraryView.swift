//
//  LibraryView.swift
//  Kanji Learning App
//
//  Created by Admin on 2024. 10. 14..
//

import SwiftUI

struct LibraryView: View {
    @StateObject var viewModel: LibraryViewModel
    
    @EnvironmentObject private var container: DependencyContainer
    @FocusState private var isSearchBarFocused: Bool
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil)
    ]

    var body: some View {
        ZStack {
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
                                viewModel.loadMoreKanji()
                            }
                    }
                }
            }
            
            searchBar
                .frame(maxHeight: .infinity, alignment: .bottom)
        }
        .onAppear {
            viewModel.loadInitialKanji()
        }
        .sheet(isPresented: ($viewModel.showDetailsSheet), content: {
            KanjiDetailsView(viewModel: container.makeKanjiDetailsViewModel(), kanji: $viewModel.kanjiDetails)
        })
    }
    
    var searchBar: some View {
        HStack {
            TextField("Search...", text: $viewModel.searchTerm)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .opacity(isSearchBarFocused ? 1.0 : 0.5)
                .focused($isSearchBarFocused)
                .cornerRadius(8)
                .overlay(
                   Button(action: {
                       // TODO: scroll to top
                       viewModel.loadInitialKanji()
                   }) {
                       Image(systemName: "magnifyingglass")
                           .foregroundColor(.gray)
                           .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                           .padding(.leading, 8)
                   }
                    .disabled(viewModel.isLoading)
                    .opacity(viewModel.isLoading ? 1.0 : 0.5)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                )
                .padding(.horizontal, 10)
        }
    }
}
