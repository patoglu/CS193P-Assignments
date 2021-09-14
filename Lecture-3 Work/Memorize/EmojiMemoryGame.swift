//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Yusuf Patoglu on 14.09.2021.
//

import SwiftUI //It's part of UI.





class EmojiMemoryGame {
    static let emojis = ["🥦","🧄","🥑","🍉","🥒","🌶️","🫑","🌽","🥕","🫒","🥔","🍠","🧅","🍆","🍏","🍐","🍊","🍋","🍌","🫐","🍈","🍒","🍑","🥭","🍍","🥥","🥝","🍇","🍓","🍅"]
    private(set) var model: MemoryGame<String> = createMemoryGame()
    static func createMemoryGame() -> MemoryGame<String>
    {
        MemoryGame<String>(numberOfPairsOfCards: 4) {pairIndex in emojis[pairIndex]}
    }
    
       
    var cards: Array<MemoryGame<String>.Card>
    {
        return model.cards
    }
}
