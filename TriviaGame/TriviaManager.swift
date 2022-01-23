//
//  TriviaManager.swift
//  TriviaGame
//
//  Created by Apple on 21/01/22.
//

import Foundation
import SwiftUI

class TriviaManager: ObservableObject{

    @Published private(set) var amount = 10
    @Published private(set) var difficulty: String = "easy"
    @Published private(set) var cat: Int = 0
    @Published private(set) var l: Int = 1
    @Published private(set) var categorySelected = false
    @Published private(set) var difficultySelected = false
    
    private var widthProgressBar: CGFloat = UIScreen.main.bounds.width - 40
    private(set) var trivia: [Trivia.Result] = []
    @Published private(set) var length = 0
    @Published private(set) var index = 0
    @Published private(set) var reachedEnd = false
    @Published private(set) var answerSelected = false
    @Published private(set) var question: AttributedString = ""
    @Published private(set) var answerChoices: [Answer] = []
    @Published private(set) var progress: CGFloat = 0.00
    @Published private(set) var score: Int = 0
    
    
    init(){
        Task.init{
            await fetchTrivia()
        }
    }
    
    
    func fetchCategory(category: Category){
        cat = category.value
        categorySelected = true
    }
    func fetchDifficulty(difficulty: Difficulty){
        l = difficulty.level
        difficultySelected = true
    }
    
    
    func fetchTrivia() async{

        // set difficulty
        if l == 1 {
            difficulty = "easy"}
        else if l == 2{
            difficulty = "medium"}
        else{
            difficulty = "hard"}
    
         // URL
        guard let url = URL(string: "https://opentdb.com/api.php?amount=\(amount)&category=\(cat)&difficulty=\(difficulty)") else { fatalError("Missing API")}
        
//        guard let url = URL(string: "https://opentdb.com/api.php?amount=10&category=14&difficulty=easy") else { fatalError("Missing API")}
        
        let urlRequest = URLRequest(url: url)

        do{
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard ( response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data")}
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let decodedData = try decoder.decode(Trivia.self, from: data)
            
            DispatchQueue.main.async {
                self.index = 0
                self.score = 0
                self.progress = 0.00
                self.reachedEnd = false
                
                self.trivia = decodedData.results
                self.length = self.trivia.count
                self.setQuestion()
            }
            
        } catch{
            print("Error fetching trivia: \(error)")
        }
    }

    
    func goToNextQuestion(){
        if index + 1 < length{
            index += 1
            setQuestion()
        }
        else{
            reachedEnd = true
        }
    }
    
    func setQuestion(){
        answerSelected = false
        progress = CGFloat(Double(index + 1) / Double(length) * widthProgressBar)
        
        if index < length {
            let currentTriviaQuestion = trivia[index]
            question = currentTriviaQuestion.formattedQuestion
            answerChoices = currentTriviaQuestion.answers
        }
    }
    
    func selectAnswer(answer: Answer){
        answerSelected = true
        if answer.isCorrect{
            score += 1
        }
    }
    
}
