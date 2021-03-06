//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Yusuf Patoglu on 12.09.2021.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    //2-)It's observing viewModel now.
    @ObservedObject var game: EmojiMemoryGame //This is a view model variable.
    var body: some View {
        AspectVGrid(items: game.cards, aspectRatio: 2/3) { card in
            if card.isMatched && !card.isFaceUp {
                Rectangle().opacity(0)
            } else {
                CardView(card: card)
                    .padding(4)
                    .onTapGesture {
                        game.choose(card)
                    }
            }
        }
        .foregroundColor(.red)
        .padding(.horizontal)
    }
    /*
    @ViewBuilder
    private func cardView(for card: EmojiMemoryGame.Card) -> some View
    {
        if card.isMatched && !card.isFaceUp {
            Rectangle().opacity(0)
        } else {
            CardView(card: card).padding(4)
                            .onTapGesture {
                                game.choose(card)
                            }
        }
    }
    */
    
}



struct CardView: View
{
    let card: EmojiMemoryGame.Card
    
    var body: some View
    {
        GeometryReader{ geometry in
            ZStack
            {
                let shape =  RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                if card.isFaceUp == true
                {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                    Pie(startAngle: Angle(degrees: 0 - 90), endAngle: Angle(degrees: 110 - 90)).padding(5).opacity(0.5)
                    Text(card.content).font(font(in: geometry.size))
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
    
    private func font(in size: CGSize) -> Font
    {
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.7
        
    }
}









struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(game.cards.first!)
        return EmojiMemoryGameView(game: game)
            .preferredColorScheme(.dark)
        
    }
}
