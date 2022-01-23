//
//  DifficultyView.swift
//  TriviaGame
//
//  Created by Apple on 22/01/22.
//

import SwiftUI

struct DifficultyView: View {
    
    var difficulty: [Difficulty] = DifficultyArray.arr
    
//    @EnvironmentObject var difficultyManager: DifficultyManager
    @EnvironmentObject var triviaManager: TriviaManager
    
    var body: some View {
        NavigationView {
            VStack(){
                Text("Trivia Game")
                    .orangeTitle()
                    .padding()
            
                SubTitleView(text: "Difficulty")
                HStack{
                    Text("Choose")
                        .font(.caption)
                    Spacer()
                }.padding(0)
                
                // cards
                ScrollView(.vertical, showsIndicators: true){
                    ForEach(difficulty, id: \.id){ dif in
                        
                        DifficultyRow(difficulty: Difficulty(text: dif.text,
                                                       level: dif.level))
                            .environmentObject(TriviaManager())
                    }
                }
                .padding(.vertical)
                
                Spacer()
            }
            .padding()
            .frame(maxWidth: UIScreen.main.bounds.width - 30,
                   maxHeight: .infinity,
                   alignment: .leading)
            .ignoresSafeArea(edges: [.bottom])
            .navigationBarHidden(true)
        }.navigationBarHidden(true)
    }
}

struct DifficultyView_Previews: PreviewProvider {
    static var previews: some View {
        DifficultyView()
            .environmentObject(TriviaManager())
    }
}
