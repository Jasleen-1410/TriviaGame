//
//  QuestionView.swift
//  TriviaGame
//
//  Created by Apple on 21/01/22.
//

import SwiftUI

struct QuestionView: View {
    
    @EnvironmentObject var triviaManager: TriviaManager
    
    var body: some View {
        VStack(spacing: 30){

            
            // Top trivia heading
            HStack{
                Text("Trivia Game")
                    .orangeTitle()
                Spacer()
                Text("\(triviaManager.index + 1) out of \(triviaManager.length)")
                    .foregroundColor(Color("orange"))
                    .fontWeight(.heavy)
            }
        
            // Progress bar
            ProgressBar(progress: triviaManager.progress)
            
            // Question
            VStack(alignment: .leading, spacing: 20){
                Text(triviaManager.question)
                    .questionFont()
                
                ForEach(triviaManager.answerChoices, id: \.id){ answer in
                    AnswerRow(answer: answer)
                        .environmentObject(triviaManager)
                }
            }
            
            Button{
                triviaManager.goToNextQuestion()
            } label: {
                PrimaryButton(text: "Next",
                              bg: triviaManager.answerSelected ? Color("orange") : Color(.gray).opacity(0.6) )
            }
            .disabled(!triviaManager.answerSelected)
            
            
            Spacer()
            
        }
        .padding(30)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationBarHidden(true)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
            .environmentObject(TriviaManager())
    }
}
