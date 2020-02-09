//
//  BottomView.swift
//  TinderSwiftUI
//
//  Created by Nelson Gonzalez on 2/7/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import SwiftUI

struct BottomView: View {
    @ObservedObject var cards: Cards
    @Binding var person: [Person?]
    @Binding var index: Int
    
    var body: some View {
        
        HStack {
            
            Button(action: {
               //Do something
                
            }) {
                
                Image(systemName: "arrow.clockwise").resizable().frame(width: 25, height: 25).padding()
                
            }.foregroundColor(.yellow).background(Color.white).shadow(radius: 25).clipShape(Circle())
            
            Button(action: {
               
                self.cards.cards.removeAll(where: {$0.id == self.person[self.index]?.id })
                self.index += 1
                if self.cards.cards.count == 1 {
                        self.cards.fetchMore()
                }
            }) {
                
                Image(systemName: "xmark").resizable().frame(width: 30, height: 30).padding()
                
            }.foregroundColor(.pink).background(Color.white).shadow(radius: 25).clipShape(Circle())
            
            Button(action: {
                //Do something
                
            }) {
                
                Image(systemName: "star.fill").resizable().frame(width: 25, height: 25).padding()
                
            }.foregroundColor(.blue).background(Color.white).shadow(radius: 25).clipShape(Circle())
            
            Button(action: {
                self.cards.cards.removeAll(where: {$0.id == self.person[self.index]?.id })
                self.index += 1
                if self.cards.cards.count == 1 {
                        self.cards.fetchMore()
                }
            }) {
                
                Image(systemName: "heart.fill").resizable().frame(width: 35, height: 35).padding()
                
            }.foregroundColor(.blue).background(Color.white).shadow(radius: 25).clipShape(Circle())
            
            Button(action: {
              //Do something
                
            }) {
                
                Image(systemName: "bolt.fill").resizable().frame(width: 25, height: 25).padding()
                
            }.foregroundColor(.purple).background(Color.white).shadow(radius: 25).clipShape(Circle())
        }
    }
}

struct BottomView_Previews: PreviewProvider {
    static var previews: some View {
        BottomView(cards: Cards(), person: .constant([Person(name: "Test", work: "ios", image: "photo_4", age: 21)]), index: .constant(0))
    }
}
