//
//  TriviaView.swift
//  TriviaGame
//
//  Created by Apple on 21/01/22.
//

import SwiftUI

struct TriviaView: View {
    
    @EnvironmentObject var triviaManager: TriviaManager
    
    var body: some View {
        
        if triviaManager.reachedEnd {
            VStack(spacing: 20){
                Text("Trivia Game")
                    .orangeTitle()
                Text("Congratulation, You Completed the Game! 🥳")
                Text("You scored \(triviaManager.score) out of \(triviaManager.length)")
                    .bold()
                
                // Play again button
                Button {
                    Task.init{
                        await triviaManager.fetchTrivia()
                    }
                } label: {
                    PrimaryButton(text: "Play Again!!")
//                    PrimaryButton(text: String( triviaManager.cat))
                }
                .padding()
                
            }
            .foregroundColor(Color("orange"))
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        else{
            QuestionView()
                .environmentObject(triviaManager)
        }
    }
}

struct TriviaView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaView()
            .environmentObject(TriviaManager())
    }
}
