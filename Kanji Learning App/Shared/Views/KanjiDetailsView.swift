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
                        .font(.title2)
                    TabView {
                        ScrollView {
                            VStack {
                                HStack {
                                    Text("Stroke count: ")
                                        .bold()
                                    Text(String(details.strokeCount))
                                }
                                if let mnemonic = details.mnemonic {
                                    HStack {
                                        Text("Mnemonic: ")
                                            .bold()
                                        Text(mnemonic)
                                    }
                                }
                            }
                        }
                        
                        if let onyomi = details.readings.filter({$0.type == ReadingType.on}), !onyomi.isEmpty {
                            ScrollView {
                                VStack {
                                    Text("Onyomi")
                                        .bold()
                                        .font(.title3)
                                    ForEach(onyomi) { reading in
                                        Text(reading.romanization)
                                            .bold()
                                        ForEach(reading.vocabulary) { vocabEntry in
                                            HStack {
                                                Text(vocabEntry.word)
                                                Text(vocabEntry.meanings)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    
                        if let kunyomi = details.readings.filter({$0.type == ReadingType.kun}), !kunyomi.isEmpty {
                            ScrollView {
                                VStack {
                                    Text("Kunyomi")
                                        .bold()
                                        .font(.title3)
                                    ForEach(kunyomi) { reading in
                                        Text(reading.romanization)
                                            .bold()
                                        ForEach(reading.vocabulary) { vocabEntry in
                                            HStack {
                                                Text(vocabEntry.word)
                                                Text(vocabEntry.meanings)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        
                        if let components = details.components, !components.isEmpty {
                            VStack {
                                Text("Components")
                                    .bold()
                                    .font(.title3)
                                
                                ScrollView {
                                    LazyVGrid(
                                        columns: [GridItem(.adaptive(minimum: 50))],
                                        spacing: 10
                                    ){
                                        ForEach(components) { component in
                                            HStack {
                                                VStack {
                                                    Button(action: {
                                                        kanji = component
                                                    }) {
                                                        Text(component.character)
                                                            .font(.title)
                                                            .background(
                                                                RoundedRectangle(cornerRadius: 5)
                                                                    .fill(Color.black)
                                                                    .frame(width: 50, height: 50)
                                                            )
                                                            .foregroundColor(.white)
                                                            .border(Color.black, width: 2)
                                                    }
                                                    Text(component.name)
                                                }
                                                
                                                if component != components.last {
                                                    Text(" + ")
                                                        .font(.title)
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        
                        if let compositions = details.usedInCompositions, !compositions.isEmpty {
                            VStack {
                                Text("Used in compositions")
                                    .bold()
                                    .font(.title3)
                                ScrollView {
                                    LazyVGrid(
                                        columns: [GridItem(.adaptive(minimum: 50, maximum: 50))],
                                        spacing: 10
                                    ){
                                        ForEach(compositions) { component in
                                            VStack {
                                                Button(action: {
                                                    kanji = component
                                                }) {
                                                    Text(component.character)
                                                        .font(.title)
                                                        .background(
                                                            RoundedRectangle(cornerRadius: 5)
                                                                .fill(Color.black)
                                                                .frame(width: 50, height: 50)
                                                        )
                                                        .foregroundColor(.white)
                                                        .border(Color.black, width: 2)
                                                }
                                                Text(component.name)
                                            }
                                        }
                                    }
                                    
                                }
                            }
                        }
                        VStack {
                            
                        }
                        VStack {
                            
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
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
