//
//  Assignment_2App.swift
//  Assignment 2
//
//  Created by Yusuf Patoglu on 16.09.2021.
//

import SwiftUI

@main
struct Assignment_2App: App {
    var body: some Scene {
        let game = EmojiMemoryGame()
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
