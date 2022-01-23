//
//  Trivia.swift
//  TriviaGame
//
//  Created by Apple on 21/01/22.
//
import SwiftUI
import Foundation


//struct CategoryValue: Identifiable{
//    var id = UUID()
//    var value: Int
//}
//struct DifficultyValue: Identifiable{
//    var id = UUID()
//    var level: Int
//}


struct Trivia: Decodable{
    var results: [Result]
    
    struct Result: Decodable, Identifiable{
        var id: UUID {
            // Creating instance because id is not generated from API
            UUID()
        }
        var category: String
        var type: String
        var difficulty: String
        var question: String
        var correctAnswer: String
        var incorrectAnswers: [String]
        
        var formattedQuestion: AttributedString{
            do{
                return try AttributedString(markdown: question)
            } catch {
                print("Error setting formattedQuestion: \(error)")
                return ""
            }
        }
        
        var answers: [Answer]{
            do{
                let correct = [Answer(text: try AttributedString(markdown: correctAnswer),
                       isCorrect: true)]
                let incorrects =  try incorrectAnswers.map{ answer in
                    Answer(text: try AttributedString(markdown: answer),
                           isCorrect: false)
                }
                
                let allAnswers = correct + incorrects
                
                return allAnswers.shuffled()
                
            } catch {
                print("Error setting answers: \(error)")
                return []
            }
        }
    }
}
