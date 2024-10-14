//
//  HomeTitleView.swift
//  Kanji Learning App
//
//  Created by Admin on 2024. 10. 14..
//

import SwiftUI

struct HomeTitleView: View {
    @Binding var username: String
    
    var body: some View {
        VStack {
            Text("Kanji Learning App")
                .font(.title)
                .fontWeight(.bold)
            Text("Welcome, \(username)")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
}
