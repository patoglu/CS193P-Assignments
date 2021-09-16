//
//  MemoryGame.swift
//  Assignment 2
//
//  Created by Yusuf Patoglu on 16.09.2021.
//

import Foundation


struct MemoryGame <CardContent> where CardContent: Equatable
{
    private (set) var cards: Array<Card>
    private (set) var score: Int = 0
    private var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent)
    {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards
        {
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
    
        }
        cards.shuffle()
    }
    struct Card: Identifiable
    {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var isSeen: Bool = false
        var content: CardContent
        var id: Int
    }
    mutating func choose(_ card: Card)
    {
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard
            {
                if(cards[chosenIndex].content == cards[potentialMatchIndex].content)
                {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2
                    if(isAllMatched())
                    {
                        //xcards = Array<Card>()
                    }
                }
                else if cards[chosenIndex].isSeen
                {
                    score -= 1
                }
                cards[chosenIndex].isSeen = true
                indexOfTheOneAndOnlyFaceUpCard = nil
            }
            else
            {
                if cards[chosenIndex].isSeen
                {
                    score -= 1
                }
               
                for index in cards.indices
                {
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                cards[indexOfTheOneAndOnlyFaceUpCard!].isSeen = true
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
    func getScore() -> Int
    {
        score
    }
    func isAllMatched() -> Bool
    {
        for index in cards.indices
        {
            if(!cards[index].isSeen)
            {
                return false
            }
        }
        return true
    }
    
}
