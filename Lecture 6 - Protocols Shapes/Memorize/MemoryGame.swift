//
//  File.swift
//  Memorize
//
//  Created by Yusuf Patoglu on 14.09.2021.
//

import Foundation //Contains array, dictionary, strings etc. Not related to buttons or views.


struct MemoryGame<CardContent> where CardContent: Equatable {
    private (set) var cards: Array<Card>
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { return cards.indices.filter({cards[$0].isFaceUp}).oneAndOnly }
        set { cards.indices.forEach{cards[$0].isFaceUp = ($0 == newValue)} }
    }
    mutating func choose(_ card: Card) //arguments of this function is "let"
    {
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard
            {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content
                {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                cards[chosenIndex].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
        
    }
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent)
    {
        cards = []  
        // add numberOfPairsOfCards x 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards
        {
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
    }
    struct Card: Identifiable
    {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        let content: CardContent
        let id: Int
    }
}

extension Array
{
    //extension variables must be computed.
    var oneAndOnly: Element?
    {
        if self.count == 1 {
            return self.first
        } else {
            return nil
        }
    }
}
