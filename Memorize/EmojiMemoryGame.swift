//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by นางสาวณัฐภูพิชา อรุณกรพสุรักษ์ on 5/3/2568 BE.
//

// View Model
import Foundation

class EmojiMemoryGame: ObservableObject {
    private static var emojis = ["🎃","💀","🕸️","😈","👻","🙀","🍭","👹"]  // static จะถูกสร้างก่อน
    
    @Published private var model = createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        var model = MemoryGame(numberOfPairs: 8) { index in
            emojis.indices.contains(index) ? emojis[index]: "⁉️"
        }
        model.shuffled()
        return model
    }
    
    func restart() {
        model = EmojiMemoryGame.createMemoryGame()
    }
    
    var cards: [MemoryGame<String>.Card] {
        model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func shuffled() {
        model.shuffled()
    }
}
