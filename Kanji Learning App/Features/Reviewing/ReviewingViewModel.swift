//
//  ReviewingViewModel.swift
//  Kanji Learning App
//
//  Created by David Karafa on 06/01/2025.
//


import Foundation
import Combine

public class ReviewingViewModel: ObservableObject {
    @Published var character: String?
    @Published var question: String?
    @Published var answer: String?
    @Published var isAnswerCorrect: Bool?
    @Published var isQuizFinished: Bool = false
    
    @Published var isLoading: Bool
    
    private let reviewingService: ReviewingServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    private var questions: [Quiz] = []
    private var currentQuestionIndex = -1
    
    init(reviewingService: ReviewingServiceProtocol, kanji: Kanji) {
        self.isLoading = true
        self.reviewingService = reviewingService
        fetchProgress(of: kanji)
    }
    
    func nextButtonClicked() {
        checkAnswer()
        moveToNextQuestion(after: 1)
    }
    
    private func checkAnswer() {
        guard currentQuestionIndex >= 0, currentQuestionIndex < questions.count else {
            return
        }
        
        self.isAnswerCorrect = self.answer?.lowercased() == self.questions[currentQuestionIndex].answer.lowercased()
        questions[currentQuestionIndex].isAnswerCorrect = self.isAnswerCorrect
    }
    
    private func moveToNextQuestion(after delay: TimeInterval) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) { [weak self] in
            self?.setNextQuestion()
        }
    }
    
    private func loadReview(for kanji: KanjiProgress) {
        setupQuestions(for: kanji.kanjiDetails)
        self.character = kanji.kanjiDetails.character
        setNextQuestion()
        isLoading = false
    }
    
    private func setNextQuestion() {
        currentQuestionIndex += 1
        guard self.currentQuestionIndex >= 0, self.currentQuestionIndex < self.questions.count else {
            isQuizFinished = true
            return
        }
        
        self.question = questions[currentQuestionIndex].question
        self.answer = nil
        self.isAnswerCorrect = nil
    }
    
    private func setupQuestions(for kanji: KanjiDetails) {
        questions = [
            Quiz(question: "What is the name of this kanji?", answer: kanji.name.lowercased())
        ]
        
        if let kunyomi = kanji.readings.first(where: { $0.type == .kun }),
           let word = kunyomi.vocabulary.first?.word {
            questions.append(Quiz(
                question: "What is it's kun'yomi reading in this word?\n" + word,
                answer: kunyomi.romanization.lowercased()
            ))
        }
        
        if let onyomi = kanji.readings.first(where: { $0.type == .on }),
           let word = onyomi.vocabulary.first?.word {
            questions.append(Quiz(
                question: "What is it's on'yomi reading in this word?\n" + word,
                answer: onyomi.romanization.lowercased()
            ))
        }
    }
    
    private func fetchProgress(of kanji: Kanji) {
        reviewingService.fetchKanjiProgress(of: kanji.name)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { completion in
                    if case .failure(let error) = completion {
                        print("Error fetching kanji progress: \(error)")
                    }
                },
                receiveValue: { [weak self] progress in
                    self?.loadReview(for: progress)
                }
            )
            .store(in: &cancellables)
    }
}
