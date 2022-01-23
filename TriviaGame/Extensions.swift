//
//  Extensions.swift
//  TriviaGame
//
//  Created by Apple on 21/01/22.
//

import Foundation
import SwiftUI

extension Text{
    func orangeTitle() -> some View{
        self.font(.title)
            .fontWeight(.heavy)
            .foregroundColor(Color("orange"))
            .shadow(radius: 1)
    }
    
    func questionFont() -> some View{
        self.font(.system(size: 20, weight: .bold))
            .foregroundColor(.black)
            .opacity(0.7)
    }
}


// subtitle
struct SubTitleView: View {
    
    var text: String
    var body: some View {
        HStack(){
            Text(text)
                .bold()
                .font(.system(size: 25))
//                .foregroundColor(.gray)
            Spacer()
        }
    }
}
