//
//  ReviewingViewController.swift
//  Kanji Learning App
//
//  Created by David Karafa on 06/01/2025.
//

import UIKit
import Combine

public class ReviewingViewController: UIViewController {
    private let viewModel: ReviewingViewModel
    private var cancellables = Set<AnyCancellable>()
    
    private let characterLabel = UILabel()
    private let questionLabel = UILabel()
    private let answerTextField = UITextField()
    private let nextButton = UIButton(type: .system)
    
    init(viewModel: ReviewingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        characterLabel.font = UIFont.systemFont(ofSize: 48, weight: .bold)
        characterLabel.textAlignment = .center
        characterLabel.numberOfLines = 1
        
        questionLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        questionLabel.textAlignment = .center
        questionLabel.numberOfLines = 0
        
        answerTextField.borderStyle = .roundedRect
        answerTextField.placeholder = "Your answer"
        
        nextButton.setTitle("Next", for: .normal)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [
            characterLabel,
            questionLabel,
            answerTextField,
            nextButton
        ])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func bindViewModel() {
        viewModel.$character
            .receive(on: DispatchQueue.main)
            .sink { [weak self] character in
                self?.characterLabel.text = character
            }
            .store(in: &cancellables)
        
        viewModel.$question
            .receive(on: DispatchQueue.main)
            .sink { [weak self] question in
                self?.questionLabel.text = question
            }
            .store(in: &cancellables)
        
        viewModel.$answer
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.answerTextField.text = ""
            }
            .store(in: &cancellables)
        
        viewModel.$isQuizFinished
            .receive(on: DispatchQueue.main)
            .sink { [weak self] isFinished in
                self?.nextButton.setTitle(isFinished ? "Finish Review" : "Next", for: .normal)
                self?.answerTextField.isHidden = isFinished
                self?.questionLabel.isHidden = isFinished
            }
            .store(in: &cancellables)
        
        viewModel.$isAnswerCorrect
            .receive(on: DispatchQueue.main)
            .sink { [weak self] isCorrect in
                UIView.animate(withDuration: 0.2) {
                    if let isCorrect = isCorrect {
                        if isCorrect {
                            let correctColor = UIColor(red: 0.3176, green: 0.7098, blue: 0.4196, alpha: 1.0)
                            self?.answerTextField.backgroundColor = correctColor
                        } else {
                            let incorrectColor = UIColor(red: 0.7882, green: 0.2196, blue: 0.2196, alpha: 1.0)
                            self?.answerTextField.backgroundColor = incorrectColor
                        }
                    } else {
                        self?.answerTextField.backgroundColor = UIColor.white
                    }
                }
            }
            .store(in: &cancellables)
    }
    
    @objc private func nextButtonTapped() {
        if viewModel.isQuizFinished {
            dismiss(animated: true, completion: nil)
        } else {
            viewModel.answer = answerTextField.text
            viewModel.nextButtonClicked()
        }
    }
}
