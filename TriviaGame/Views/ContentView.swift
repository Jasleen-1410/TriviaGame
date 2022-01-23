//
//  ContentView.swift
//  TriviaGame
//
//  Created by Apple on 21/01/22.
//

//API: URL https://opentdb.com/api.php?amount=10&category=17


import SwiftUI

struct ContentView: View {
    
    @StateObject var triviaManager = TriviaManager()
//    @EnvironmentObject var triviaManager: TriviaManager
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10){
                Spacer()
                
                // Title and image
                VStack(spacing: 1){
                    Text("Trivia Game")
                        .orangeTitle()
                    
                    Image("Icon")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                    
                    Text("Are you ready to test out your Trivia Skills?")
                        .foregroundColor(Color("orange"))
                        .padding()
                }
                .padding(.horizontal)
                
                // Button
                NavigationLink {
                    
                    CategoryView()
                    
//                    TriviaView()
//                        .environmentObject(triviaManager)
                } label: {
                    PrimaryButton(text: "Let's Go!")
                }
               
                
                Spacer()
            }
            .frame( maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
    }
}
