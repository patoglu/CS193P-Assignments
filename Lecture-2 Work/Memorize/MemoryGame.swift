//
//  File.swift
//  Memorize
//
//  Created by Yusuf Patoglu on 14.09.2021.
//

import Foundation //Contains array, dictionary, strings etc. Not related to buttons or views.


struct MemoryGame {
    var cards: Array<Card>
    func choose(_ card: Card)
    {
        
    }
    struct Card
    {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
