//
//  File.swift
//  Memorize
//
//  Created by Yusuf Patoglu on 14.09.2021.
//

import Foundation //Contains array, dictionary, strings etc. Not related to buttons or views.


struct MemoryGame<CardContent> {
    private (set) var cards: Array<Card>
    func choose(_ card: Card)
    {
        
    }
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent)
    {
        cards = Array<Card>()
        // add numberOfPairsOfCards x 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards
        {
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    struct Card
    {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
