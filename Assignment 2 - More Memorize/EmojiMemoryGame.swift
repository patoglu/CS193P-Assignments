//
//  EmojiMemoryGame.swift
//  Assignment 2
//
//  Created by Yusuf Patoglu on 16.09.2021.
//

import SwiftUI

class EmojiMemoryGame : ObservableObject
{
    init()
    {
        theme = EmojiMemoryGame.themes.randomElement()!
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    @Published private(set) var model: MemoryGame<String>
    private var theme: Theme
    static var themes: Array<Theme> =
    [
      
        Theme(nameOfTheme: "Fruits",
              emojis: ["🥦","🧄","🥑","🍉","🥒","🌶️","🫑","🌽","🥕","🫒","🥔","🍠","🧅","🍆","🍏","🍐","🍊","🍋","🍌","🫐","🍈","🍒","🍑","🥭","🍍","🥥","🥝","🍇","🍓","🍅"],
              numberOfPairsOfCards: 6,
              colour: "Green"),
        Theme(nameOfTheme: "Faces",
              emojis:   ["😀","😛","🥺","😗","😢","🤭","🤗","😲","😳","🙄"],
              numberOfPairsOfCards: 10,
              colour: "Yellow"),
        Theme(nameOfTheme: "Clothes",
              emojis:   ["👚","👖","🧣","🧤","👗","👔","🩳","🥾","🧢"],
              numberOfPairsOfCards: 5,
              colour: "Pink"),
        Theme(nameOfTheme: "Sports",
              emojis:   ["🏹","⛷️","🤺","🤼‍♀️","🏋️‍♀️","🥋","⚽","🎾"],
              numberOfPairsOfCards: 8,
              colour: "Blue"),
        Theme(nameOfTheme: "Animals",
              emojis:   ["🦑","🐞","🐧","🐱","🐻‍❄️","🐥","🦅","🐍","🐢","🐬"],
              numberOfPairsOfCards: 8,
              colour: "Red"),
        Theme(nameOfTheme: "Cars",
              emojis: ["🚒","🚑","🚓","🏎️","🚎","🚌","🚙","🚕","🚗","🚜","🚛"],
              numberOfPairsOfCards: 6,
              colour: "Orange")
    
    ]
    static func createMemoryGame(theme: Theme) -> MemoryGame<String>
    {
        MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairsOfCards) {pairIndex in theme.emojis[pairIndex]}

    }
    var cards:Array<MemoryGame<String>.Card>
    {
        return model.cards
    }
    
    // MARK: Intent(s)
    func choose(_ card: MemoryGame<String>.Card)
    {
        model.choose(card)
    }
    func createGame()
    {
        theme = EmojiMemoryGame.themes.randomElement()!
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    var nameOfTheme : String
    {
        return theme.nameOfTheme
    }
    var colourOfTheme: Color
    {
        switch theme.colour
        {
        case "Green":
            return .green
        case "Yellow":
            return .yellow
        case "Pink":
            return .pink
        case "Blue":
            return .blue
        case "Red":
            return .red
        case "Orange":
            return .orange
        default:
            return .red
        }
    }
    var getScore: Int
    {
        model.getScore()
    }
    
}
