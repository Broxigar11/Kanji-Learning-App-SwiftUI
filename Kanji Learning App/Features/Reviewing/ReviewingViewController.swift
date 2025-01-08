//
//  ReviewingViewController.swift
//  Kanji Learning App
//
//  Created by David Karafa on 06/01/2025.
//

import Foundation
import UIKit

public class ReviewingViewController: UIViewController {
    private let viewModel: ReviewingViewModel

    init(viewModel: ReviewingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
}
