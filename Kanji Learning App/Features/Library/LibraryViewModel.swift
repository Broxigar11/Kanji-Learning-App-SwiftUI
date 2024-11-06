//
//  LibraryViewModel.swift
//  Kanji Learning App
//
//  Created by Admin on 2024. 10. 14..
//

import Foundation
import Combine

class LibraryViewModel: ObservableObject {
    @Published var kanjiList: [Kanji] = []
    @Published var isLoading: Bool = false
    @Published var kanjiDetails: Kanji? = nil
    @Published var showDetailsSheet: Bool = false
    @Published var searchTerm: String = ""
    
    private let kanjiService: KanjiService
    private var cancellables = Set<AnyCancellable>()
    private var currentPage = 0
    private let pageSize = 10
    private var canLoadMorePages = true

    init(kanjiService: KanjiService) {
        self.kanjiService = kanjiService
    }
    
    func loadInitialKanji() {
        kanjiList = []
        kanjiDetails = nil
        showDetailsSheet = false
        currentPage = 0
        canLoadMorePages = true
        loadMoreKanji()
    }
    
    func loadMoreKanji() {
        guard !isLoading && canLoadMorePages else { return }
        isLoading = true

        let publisher: AnyPublisher<[Kanji], Error> = searchTerm.isEmpty ?
            kanjiService.fetchKanjiPage(page: currentPage, pageSize: pageSize) :
            kanjiService.searchKanjiPage(page: currentPage, pageSize: pageSize, searchTerm: searchTerm)

        publisher
            .sink(
                receiveCompletion: { [weak self] completion in
                    guard let self = self else { return }
                    self.isLoading = false
                    
                    if case .failure(_) = completion {
                        self.canLoadMorePages = false
                    }
                },
                receiveValue: { [weak self] newKanji in
                    guard let self = self else { return }
                    
                    if newKanji.isEmpty {
                        self.canLoadMorePages = false
                    } else {
                        self.kanjiList.append(contentsOf: newKanji)
                        self.currentPage += 1
                    }
                }
            )
            .store(in: &cancellables)
    }

    func showDetails(of kanji: Kanji) {
        if showDetailsSheet && self.kanjiDetails == kanji {
            showDetailsSheet = false
            self.kanjiDetails = nil
        } else {
            showDetailsSheet = true
            self.kanjiDetails = kanji
        }
    }
    
}
