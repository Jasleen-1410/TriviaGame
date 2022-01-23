//
//  StartQuizView.swift
//  TriviaGame
//
//  Created by Apple on 22/01/22.
//

import SwiftUI

struct StartQuizView: View {
    
    @StateObject var triviaManager = TriviaManager()
    
    var body: some View {
        
        VStack(){
            
            // Button
            NavigationLink(
                destination:
                    TriviaView()
                    .environmentObject(triviaManager),
                label: {
                    PrimaryButton(text: "Start")
                }
            ).navigationBarHidden(true)
          
        }
    }
}

struct StartQuizView_Previews: PreviewProvider {
    static var previews: some View {
        StartQuizView()
    }
}
