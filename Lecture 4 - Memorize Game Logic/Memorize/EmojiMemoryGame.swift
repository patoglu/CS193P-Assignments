//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Yusuf Patoglu on 14.09.2021.
//

import SwiftUI //It's part of UI.





class EmojiMemoryGame : ObservableObject{
    static let emojis = ["🥦","🧄","🥑","🍉","🥒","🌶️","🫑","🌽","🥕","🫒","🥔","🍠","🧅","🍆","🍏","🍐","🍊","🍋","🍌","🫐","🍈","🍒","🍑","🥭","🍍","🥥","🥝","🍇","🍓","🍅"]
    //1-)View model publishes that "something changed" to the world everytime model changes.
    @Published private(set) var model: MemoryGame<String> = createMemoryGame()
    static func createMemoryGame() -> MemoryGame<String>
    {
        MemoryGame<String>(numberOfPairsOfCards: 4) {pairIndex in emojis[pairIndex]}
    }
    var cards: Array<MemoryGame<String>.Card>
    {
        return model.cards
    }
    // MARK: -Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card)
    {
        //objectWillChange.send() One way to notify that this object will change.
        model.choose(card)
    }
}
