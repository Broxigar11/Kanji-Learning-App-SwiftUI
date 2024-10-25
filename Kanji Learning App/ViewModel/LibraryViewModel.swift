//
//  LibraryViewModel.swift
//  Kanji Learning App
//
//  Created by Admin on 2024. 10. 14..
//

import Foundation

class LibraryViewModel: ObservableObject {
    @Published var kanjiList: [Kanji] = []
    @Published var isLoading: Bool = false
    @Published var kanjiDetails: KanjiDetails? = nil
    @Published var showDetailsSheet: Bool = false
    private var currentPage = 1
    private let pageSize = 50
    private var canLoadMorePages = true

    func loadInitialKanji() {
        kanjiList = [
            Kanji(id: 1, character: "一", name: "One"),
            Kanji(id: 2, character: "二", name: "Two"),
            Kanji(id: 3, character: "三", name: "Three")
        ]
        kanjiDetails = nil
        showDetailsSheet = false
        currentPage = 1
        canLoadMorePages = true
        loadMoreKanjiIfNeeded()
    }

    func loadMoreKanjiIfNeeded() {
        guard !isLoading && canLoadMorePages else { return }
        isLoading = true

        fetchKanji(page: currentPage) { [weak self] newKanji in
            guard let self = self else { return }
            self.isLoading = false
            if newKanji.isEmpty {
                self.canLoadMorePages = false  // No more kanji to load
            } else {
                self.kanjiList.append(contentsOf: newKanji)
                self.currentPage += 1
            }
        }
    }

    func showDetails(of id: Int) {
        if showDetailsSheet && kanjiDetails?.id == id {
            showDetailsSheet = false
            kanjiDetails = nil
        } else {
            showDetailsSheet = true
            kanjiDetails = fetchKanjiDetails(of: id)
        }
    }
    
    private func fetchKanji(page: Int, completion: @escaping ([Kanji]) -> Void) {
        // Replace with your actual API call to fetch kanji data
//        KanjiAPI.getKanji(page: page, pageSize: pageSize) { result in
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let kanjiList):
//                    completion(kanjiList)
//                case .failure(let error):
//                    print("Error fetching kanji: \(error.localizedDescription)")
//                    completion([])
//                }
//            }
//        }
    }
    
    private func fetchKanjiDetails(of id: Int) -> KanjiDetails { //temp
        return KanjiDetails(id: 1, character: "一", name: "one", strokeCount: 1, orderNumber: 1, mnemonic: nil, composition: [], onyomi: [], kunyomi: [], note: nil, nextReviewDate: nil)
    }
    
}
