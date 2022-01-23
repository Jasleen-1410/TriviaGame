//
//  CategoryRow.swift
//  TriviaGame
//
//  Created by Apple on 22/01/22.
//

import SwiftUI

struct CategoryRow: View {
    
    var category: Category
    @State private var isSelected = false

//    @EnvironmentObject var categoryManager: CategoryManager
    @EnvironmentObject var triviaManager: TriviaManager
    
    var body: some View {
        HStack{
            Text(category.text)
                .bold()
                .font(.system(size: 24))
            Spacer()
            
            // If selected
            if triviaManager.categorySelected {
                // Button
                NavigationLink(
                    destination:
                        DifficultyView(),
                    label: {
                        // To know which value it is fetching
//                        Text(String(triviaManager.cat))
//                            .foregroundColor(.white)
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
            if !triviaManager.categorySelected{
                isSelected = true
//                categoryManager.categorySelection(category: category)
                triviaManager.fetchCategory(category: category)
            }
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(category: Category(text: "Hi", value: 10))
            .environmentObject(TriviaManager())
    }
}

