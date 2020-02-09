//
//  CardsController.swift
//  TinderSwiftUI
//
//  Created by Nelson Gonzalez on 2/5/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import Foundation

class Cards : ObservableObject {
    @Published var cards = [Person(name: "Jennifer", work: "ios", image: "person_4", age: 29), Person(name: "Vero", work: "Writter", image: "person_5", age: 33),Person(name: "Paul", work: "Teacher", image: "person_6", age: 30), Person(name: "Jack", work: "Musician", image: "person_7", age: 23)]
    
    func fetchMore() {
   
           let morePeople = [Person(name: "Jennifer", work: "ios", image: "person_4", age: 29), Person(name: "Vero", work: "Writter", image: "person_5", age: 33),Person(name: "Paul", work: "Teacher", image: "person_6", age: 30), Person(name: "Jack", work: "Musician", image: "person_7", age: 23)]
       
        self.cards.insert(contentsOf: morePeople, at: self.cards.startIndex)
       
       
           
    }
}
