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
        
            ScrollView
            {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))])
                {
                    ForEach(game.cards){card in
                        CardView(card: card).aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                game.choose(card)
                            }
                    }
                }
            }
          
            .foregroundColor(.red)
            .padding(.horizontal)

        
    }
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
        static let cornerRadius: CGFloat = 20
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.8
    }
}









struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.dark)
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.light)
        
    }
}
