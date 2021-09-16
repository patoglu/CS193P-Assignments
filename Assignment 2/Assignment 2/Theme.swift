//
//  Theme.swift
//  Assignment 2
//
//  Created by Yusuf Patoglu on 16.09.2021.
//

import Foundation


struct Theme
{
    var nameOfTheme: String
    var emojis: Array<String>
    var numberOfPairsOfCards: Int
    var colour: String
    
    init(nameOfTheme: String, emojis: Array<String>, numberOfPairsOfCards: Int, colour: String)
    {
        self.nameOfTheme = nameOfTheme
        self.emojis = emojis
        self.numberOfPairsOfCards = numberOfPairsOfCards > emojis.count ? emojis.count : numberOfPairsOfCards
        self.colour = colour
    }
}
