//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Yusuf Patoglu on 12.09.2021.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
