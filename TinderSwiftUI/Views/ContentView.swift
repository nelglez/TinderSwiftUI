//
//  ContentView.swift
//  TinderSwiftUI
//
//  Created by Nelson Gonzalez on 2/4/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    @ObservedObject var card = Cards()
    @State private var person: [Person?] = []
    @State private var index = 0
    
    var body: some View {
        
        VStack {
            
            GeometryReader { geometry in
                
                ZStack{
                    
                    ForEach(self.card.cards) { i in
                        
                        CardView(person: i, onRemove: { removedPerson in
                            print(removedPerson.name)
                           
                            self.card.cards.removeAll(where: {$0.id == removedPerson.id})
                            
                            self.index += 1
                            
                            if self.card.cards.count == 1 {
                              
                                    self.card.fetchMore()
                               
                            }
                            
                        }).onAppear(perform: {
                            
                            self.person.append(i)
                        }).animation(.spring())
                        
                    }
                }
            }
            if self.card.cards.count != 0 {
                
                BottomView(cards: self.card, person: $person, index: $index).padding(.top, 30).padding(.bottom, 100)
                Spacer()
                
            }
        }.padding(.top, 100)
    }
}


    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

   

  
