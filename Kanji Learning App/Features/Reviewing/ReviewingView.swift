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
    @EnvironmentObject var container: DependencyContainer
    
    public func makeUIViewController(context: Context) -> ReviewingViewController {
        let viewModel = container.makeReviewingViewModel()
        return ReviewingViewController(viewModel: viewModel)
    }
    
    public func updateUIViewController(_ uiViewController: ReviewingViewController, context: Context) {
        // Update the UIKit view controller if needed
    }
}
