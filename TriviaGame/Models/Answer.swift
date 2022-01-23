//
//  Answer.swift
//  TriviaGame
//
//  Created by Apple on 21/01/22.
//

import Foundation

struct Answer: Identifiable{
    var id = UUID()
    var text: AttributedString
    var isCorrect: Bool
}
