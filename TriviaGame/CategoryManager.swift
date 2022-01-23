//
//  CategoryManager.swift
//  TriviaGame
//
//  Created by Apple on 22/01/22.
//

import Foundation

class CategoryManager: ObservableObject{
    
    @Published private(set) var categorySelected = false
    @Published private(set) var categoryValue: Int = 0
    
    func categorySelection(category: Category){
        categorySelected = true
        categoryValue = category.value
    }
}


