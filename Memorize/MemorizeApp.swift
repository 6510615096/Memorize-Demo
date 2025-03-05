//
//  MemorizeApp.swift
//  Memorize
//
//  Created by นางสาวณัฐภูพิชา อรุณกรพสุรักษ์ on 19/2/2568 BE.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @State var game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
