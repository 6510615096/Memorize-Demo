//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by นางสาวณัฐภูพิชา อรุณกรพสุรักษ์ on 19/2/2568 BE.
//

// View
import SwiftUI

struct EmojiMemoryGameView: View {
    var emojis = ["🎃","💀","🕸️","😈","👻","🙀","🍭","👹"]
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.blue)
    }
}

#Preview {
    EmojiMemoryGameView()
}

struct CardView: View {
    @State var isFaceUp: Bool = true
    var content: String
    var body: some View {
        ZStack {
            var base = RoundedRectangle(cornerRadius: 12)
//            var base = Ellipse()
            Group {
                base
                    .fill(.white)
                    .strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}
