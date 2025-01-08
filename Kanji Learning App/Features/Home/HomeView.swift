//
//  HomeView.swift
//  Kanji Learning App
//
//  Created by Admin on 2024. 10. 10..
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var container: DependencyContainer
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                VStack {
                    Text("Kanji Learning App")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    if let username = userManager.username {
                        Text("Welcome, \(username)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                
                Spacer()
                
                navigationView
                
                Spacer()
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    NavigationLink (
                        destination: ProfileView(),
                        label: {
                            Image(systemName: "person.fill")
                        }
                    )
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    NavigationLink (
                        destination: SettingsView(),
                        label: {
                            Image(systemName: "gear")
                        }
                    )
                }
            }
        }
        .onAppear {
            container.authManager.login()
        }
    }
    
    var navigationView: some View {
        VStack {
            VStack {
                NavigationLink(
                    "New Kanji",
                    destination: LearningView()
                )
                .font(.headline)
                .fontWeight(.bold)
            }
            
            if userManager.nextKanjiToReview != nil {
                VStack {
                    NavigationLink(
                        "Kanji Review",
                        destination: ReviewingView(viewModel: container.makeReviewingViewModel())
                    )
                    .font(.headline)
                    .fontWeight(.bold)
                
                    Text("Review Queue: \(userManager.userProgress!.kanjiReviewList.count) kanji due")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
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
