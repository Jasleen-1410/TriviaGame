//
//  ProgressBar.swift
//  TriviaGame
//
//  Created by Apple on 21/01/22.
//

import SwiftUI

struct ProgressBar: View {
    
    var progress: CGFloat
    
    var body: some View {
        ZStack(alignment: .leading)
        {
            Rectangle()
                .frame(maxWidth: UIScreen.main.bounds.width - 40,
                       maxHeight: 5)
                .foregroundColor(Color(.gray)
                                    .opacity(0.4))
                .cornerRadius(10)
            
            Rectangle()
                .frame(width: progress, height: 5)
                .foregroundColor(Color("orange"))
                .cornerRadius(10)
        }
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(progress: 10)
    }
}
