//
//  Category.swift
//  TriviaGame
//
//  Created by Apple on 22/01/22.
//

import Foundation

// List of catergory
struct Category: Identifiable{
    let id = UUID()
    let text: String
    let value: Int
}

struct CategoryArray{
    static let arr = [
        Category(text: "General Knowledge", value: 9),
        Category(text: "Books", value: 10),
        Category(text: "Films", value: 11),
        Category(text: "Music", value: 12),
        Category(text: "Video Games", value: 15),
        Category(text: "Nature and Science", value: 17),
        Category(text: "Computer Science", value: 18),
        Category(text: "Mathematics", value: 19),
        Category(text: "Mythology", value: 20),
        Category(text: "Sports", value: 21),
        Category(text: "Geography", value: 22),
        Category(text: "History", value: 23),
        Category(text: "Politics", value: 24),
        Category(text: "Arts", value: 25),
        Category(text: "Celebrities", value: 26),
        Category(text: "Animals", value: 27),
        Category(text: "Vehicles", value: 28),
        Category(text: "Comics", value: 29),
        Category(text: "Gadgets", value: 30),
    ]
}


//<option value="9">General Knowledge</option>
//<option value="10">Entertainment: Books</option>
//<option value="11">Entertainment: Film</option>
//<option value="12">Entertainment: Music</option>
//<option value="15">Entertainment: Video Games</option>
//<option value="17">Science &amp; Nature</option>
//<option value="18">Science: Computers</option>
//<option value="19">Science: Mathematics</option>
//<option value="20">Mythology</option>
//<option value="21">Sports</option>
//<option value="22">Geography</option>
//<option value="23">History</option>
//<option value="24">Politics</option>
//<option value="25">Art</option>
//<option value="26">Celebrities</option>
//<option value="27">Animals</option>
//<option value="28">Vehicles</option
//><option value="29">Entertainment: Comics</option>
//<option value="30">Science: Gadgets</option>

