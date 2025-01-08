//
//  ReviewingView.swift
//  Kanji Learning App
//
//  Created by David Karafa on 06/01/2025.
//

import Foundation
import SwiftUI
import UIKit

public struct ReviewingView: UIViewControllerRepresentable {
    private var viewModel: ReviewingViewModel
    
    init(viewModel: ReviewingViewModel) {
        self.viewModel = viewModel
    }
    
    public func makeUIViewController(context: Context) -> ReviewingViewController {
        return ReviewingViewController(viewModel: self.viewModel)
    }
    
    public func updateUIViewController(_ uiViewController: ReviewingViewController, context: Context) {
        // Update the UIKit view controller if needed
    }
}
