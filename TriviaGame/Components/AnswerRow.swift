//
//  AnswerRow.swift
//  TriviaGame
//
//  Created by Apple on 21/01/22.
//

import SwiftUI

struct AnswerRow: View {
    @EnvironmentObject var triviaManager: TriviaManager
    
    var answer: Answer
    @State private var isSelected = false
    
    var body: some View {
        HStack(spacing: 20){
            Image(systemName: "circle.fill")
                .font(.caption)
                .foregroundColor(triviaManager.answerSelected ? ( isSelected ? Color("orange") : .gray) : Color("orange") )
            
            Text(answer.text)
                .font(.title3)
                .bold()
            
            if isSelected{
                Spacer()
                
                Image(systemName: answer.isCorrect ? "checkmark.circle.fill" : "x.circle.fill")
                    .foregroundColor(answer.isCorrect ? Color("green") : Color("red"))
            }
        }
        .padding()
        .frame(maxWidth: UIScreen.main.bounds.width - 60, maxHeight: 60, alignment: .leading)
        .foregroundColor(triviaManager.answerSelected ? ( isSelected ? Color("orange") : .gray) : Color("orange") )
        .background(.white)
        .cornerRadius(20)
        .shadow(color: isSelected ? (answer.isCorrect ? Color("green") : Color("red")) : .gray, radius: 5, x: 0.5, y: 0.5)
        .onTapGesture {
            if !triviaManager.answerSelected{
                isSelected = true
                triviaManager.selectAnswer(answer: answer)
            }
        }
    }
}

struct AnswerRow_Previews: PreviewProvider {
    static var previews: some View {
        AnswerRow(answer: Answer(text: "single", isCorrect: false))
            .environmentObject(TriviaManager())
    }
}
