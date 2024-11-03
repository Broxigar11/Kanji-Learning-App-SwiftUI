//
//  HomeNavigationView.swift
//  Kanji Learning App
//
//  Created by Admin on 2024. 10. 14..
//

import SwiftUI

struct HomeNavigationView: View {
    @EnvironmentObject var container: DependencyContainer
    @Binding var learningQueue: [Kanji]
    @Binding var reviewQueue: [Kanji]
    
    var body: some View {
        VStack {
            VStack {
                NavigationLink(
                    "New Kanji",
                    destination: LearningView()
                )
                .font(.headline)
                .fontWeight(.bold)
                
                Text("Learning Queue: \(learningQueue.count) kanji due")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            VStack {
                NavigationLink(
                    "Kanji Review",
                    destination: LearningView()
                )
                .font(.headline)
                .fontWeight(.bold)
                
                Text("Review Queue: \(reviewQueue.count) kanji due")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            NavigationLink(
                "Kanji Library",
                destination: LibraryView(viewModel: container.makeLibraryViewModel())
            )
            .font(.headline)
            .fontWeight(.bold)
        }
    }
}
