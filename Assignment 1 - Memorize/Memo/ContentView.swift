//
//  ContentView.swift
//  Memo
//
//  Created by Yusuf Patoglu on 13.09.2021.
//

import SwiftUI

enum EmojiSelection
{
    case ANIMALS, CARS, INSTRUMENTS
}



struct ContentView: View {
    @State var current_emojis = ["🐟","🐬","🐳","🐋","🦈","🦭","🐊","🐅","🐆","🦓","🦍","🦧","🦣","🐘","🦛","🦏","🐪","🐫","🦒","🦘","🦬"]
    var body: some View {
        
        
        VStack
        {
            Text("Memorize!").font(.largeTitle).fontWeight(.semibold)
            ScrollView
            {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))])
                {
                    ForEach(current_emojis[0..<current_emojis.capacity], id: \.self, content: {emoji in CardView(content:  emoji)}).aspectRatio(2/3, contentMode: .fit)
                        
                                        
                }
                .foregroundColor(.red)
            }
            HStack
            {
                animal_theme
                Spacer()
                car_theme
                Spacer()
                instrument_theme
            }
            .font(.largeTitle)
            .padding(.horizontal)
          
            
            
        }
        .padding(.horizontal)
       
        
    }
    var animal_theme: some View
    {
        Button
        {
            current_emojis = ["🐟","🐬","🐳","🐋","🦈","🦭","🐊","🐅","🐆","🦓","🦍","🦧","🦣","🐘","🦛","🦏","🐪","🐫","🦒","🦘","🦬"].shuffled()
        }
        label: {
            Image(systemName: "hare.fill")
        }
    }
    var car_theme: some View
    {
        Button
        {
            current_emojis = ["🚗","🚕","🚙","🏎️","🚓","🛻","🚚","🚛","🚔","🚡","🚃","🚋","🚞"].shuffled()
        }
        label: {
            Image(systemName: "car.fill")
        }
    }
    var instrument_theme: some View
    {
        Button
        {
            
            current_emojis =       ["🎻","🎸","🪗","🎺","🎷","🪘","🎹","🎨"].shuffled()
        }
        label: {
            Image(systemName: "guitars.fill")
        }
    }
}


struct CardView: View
{
    var content: String
    @State var isFaceUp:Bool = true
    var body: some View
    {
        ZStack
        {
            let shape = RoundedRectangle(cornerRadius: 20.0)
            if(isFaceUp)
            {
                
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3.0)
                Text(content).font(.largeTitle)
            }
            else
            {
                shape.fill()
            }
        }
        .onTapGesture{
            isFaceUp = !isFaceUp
        }
    }

}








struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
