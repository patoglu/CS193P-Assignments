//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Yusuf Patoglu on 12.09.2021.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
