//
//  ContentView.swift
//  Memorize
//
//  Created by Yusuf Patoglu on 12.09.2021.
//

import SwiftUI

struct ContentView: View {
    //2-)It's observing viewModel now.
    @ObservedObject var viewModel: EmojiMemoryGame //This variable better be called as "game"
    var body: some View {
        
            ScrollView
            {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))])
                {
                    ForEach(viewModel.cards){card in
                        CardView(card: card).aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
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
    let card: MemoryGame<String>.Card
    var body: some View
    {
        ZStack
        {
            let shape =  RoundedRectangle(cornerRadius: 20)
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
