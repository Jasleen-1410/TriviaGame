//
//  DifficultyRow.swift
//  TriviaGame
//
//  Created by Apple on 22/01/22.
//

import SwiftUI

struct DifficultyRow: View {
        
        @State private var isSelected = false

        var difficulty: Difficulty
    
//        @EnvironmentObject var difficultyManager: DifficultyManager
        @EnvironmentObject var triviaManager: TriviaManager
        
        var body: some View {
            HStack{
                Text(difficulty.text)
                    .bold()
                    .font(.system(size: 24))
                Spacer()
                
                // If selected
                if triviaManager.difficultySelected {
                    // Button
                    NavigationLink(
                        destination:
                            StartQuizView(),
                        label: {
                            // To know which value it is fetching
//                            Text(String(triviaManager.l))
//                                .foregroundColor(.white)
                            Image(systemName: "arrow.right.circle.fill")
                                .foregroundColor(.white)
                                .font(.title)
                        }
                    ).navigationBarHidden(true)
                }
            }
            .padding()
            .background(isSelected ? Color("orange"): Color(.gray).opacity(0.7))
            .foregroundColor(.white)
            .frame(minHeight: 20,
                   alignment: .leading)
            .clipShape(Capsule())
            .onTapGesture {
                if !triviaManager.difficultySelected{
                    isSelected = true
//                    difficultyManager.difficultySelection(difficulty: difficulty)
                    triviaManager.fetchDifficulty(difficulty:  difficulty)
                }
            }
    }
}

struct DifficultyRow_Previews: PreviewProvider {
    static var previews: some View {
        DifficultyRow(difficulty: Difficulty(text: "Hi", level: 2))
//            .environmentObject(DifficultyManager())
            .environmentObject(TriviaManager())
    }
}
