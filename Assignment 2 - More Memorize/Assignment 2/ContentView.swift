//
//  ContentView.swift
//  Assignment 2
//
//  Created by Yusuf Patoglu on 16.09.2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    var body: some View {
        VStack {
            ScrollView
            {
                Text(viewModel.nameOfTheme).font(.largeTitle).foregroundColor(viewModel.colourOfTheme)
                Text("Score: \(viewModel.getScore)")
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))])
                {
                    ForEach(viewModel.cards)
                        {card in
                        CardView(card: card).aspectRatio(2/3, contentMode:.fit)
                        .onTapGesture {
                            viewModel.choose(card)
                         }
                    }
                }
            }
            .foregroundColor(viewModel.colourOfTheme)
            .padding(.horizontal)
            
            Button(action: {
                viewModel.createGame()
            }, label: {
                Text("New Game").fontWeight(.semibold).font(.largeTitle)
            })
        }
    }
}

struct CardView: View
{
    let card: MemoryGame<String>.Card
    var body: some View
    {
        ZStack
        {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp == true
            {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3.0)
                Text(card.content).font(.largeTitle)
            }
            else if card.isMatched == true
            {
                shape.opacity(0)
            }
            else
            {
                shape.fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
        
    }
}
