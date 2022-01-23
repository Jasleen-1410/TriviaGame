//
//  PrimaryButton.swift
//  TriviaGame
//
//  Created by Apple on 21/01/22.
//

import SwiftUI

struct PrimaryButton: View {
    
    var text: String
    var bg: Color = Color("orange")
    
    var body: some View {
        Text(text)
            .bold()
            .foregroundColor(.white)
            .padding()
            .padding(.horizontal)
            .background(bg)
            .cornerRadius(30)
            .shadow(radius: 10)
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(text: "Next")
    }
}
