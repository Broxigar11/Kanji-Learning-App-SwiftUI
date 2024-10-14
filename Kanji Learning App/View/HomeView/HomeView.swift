//
//  HomeView.swift
//  Kanji Learning App
//
//  Created by Admin on 2024. 10. 10..
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                HomeTitleView(username: $viewModel.username)
                
                Spacer()
                
                HomeNavigationView(
                    learningQueue: $viewModel.learningQueue,
                    reviewQueue: $viewModel.learningQueue
                )
                
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
    }
}
