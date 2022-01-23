//
//  Difficulty.swift
//  TriviaGame
//
//  Created by Apple on 22/01/22.
//

import Foundation


// List of catergory
struct Difficulty: Identifiable{
    let id = UUID()
    let text: String
    let level: Int
}

struct DifficultyArray{
    static let arr = [
        Difficulty(text: "Easy", level: 1),
        Difficulty(text: "Medium", level: 2),
        Difficulty(text: "Hard", level: 3)
    ]
}
