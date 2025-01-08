//
//  Kanji_Learning_AppApp.swift
//  Kanji Learning App
//
//  Created by Admin on 2024. 10. 09..
//

import SwiftUI

@main
struct Kanji_Learning_AppApp: App {
    @StateObject private var container = DependencyContainer()
    
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: container.makeHomeViewModel())
                .environmentObject(container)
                .environmentObject(container.userManager)
                .environmentObject(container.authManager)
        }
    }
}
