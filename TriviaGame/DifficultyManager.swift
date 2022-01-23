//
//  DifficultyManager.swift
//  TriviaGame
//
//  Created by Apple on 22/01/22.
//

import Foundation

class DifficultyManager: ObservableObject{
    
    @Published private(set) var difficultySelected = false
    @Published private(set) var difficultyValue: Int = 1
    
    func difficultySelection(difficulty: Difficulty){
        difficultySelected = true
        difficultyValue = difficulty.level
    }
}

