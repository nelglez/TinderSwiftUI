//
//  CardView.swift
//  TinderSwiftUI
//
//  Created by Nelson Gonzalez on 2/5/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import SwiftUI

 enum LikeDislike: Int {
       case like, dislike, none
   }
   

struct CardView: View {
    var person: Person
    
    private var onRemove: (_ person: Person) -> Void
   
    @State private var swipeStatus: LikeDislike = .none
    @State private var translation: CGSize = .zero
    
    private var thresholdPercentage: CGFloat = 0.5 // when the user has draged 50% the width of the screen in either direction
    
    
    private func getGesturePercentage(_ geometry: GeometryProxy, from gesture: DragGesture.Value) -> CGFloat {
        gesture.translation.width / geometry.size.width
    }
    
    init(person: Person, onRemove: @escaping (_ person: Person) -> Void) {
        self.person = person
        self.onRemove = onRemove
        
    }
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                ZStack(alignment: self.swipeStatus == .like ? .topLeading : .topTrailing) {
                    Image(self.person.image).resizable().aspectRatio(contentMode: .fill).frame(width: geometry.size.width, height: geometry.size.height * 0.75).clipped()
                    
                    if self.swipeStatus == .like {
                        Text("LIKE").font(.headline).padding().cornerRadius(10).foregroundColor(Color.green).overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.green, lineWidth: 3.0)).padding(24).rotationEffect(Angle.degrees(-45))
                    } else if self.swipeStatus == .dislike {
                        Text("DISLIKE").font(.headline).padding().cornerRadius(10).foregroundColor(Color.red).overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.red, lineWidth: 3.0)).padding(.top, 45).rotationEffect(Angle.degrees(45))
                    }
                }
                HStack {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("\(self.person.name) , \(self.person.age)").font(.title).bold()
                        Text(self.person.work).font(.subheadline).bold()
                        Text("3 Mutual Friends").font(.subheadline).foregroundColor(.gray)
                    }
                    Spacer()
                    
                    Image(systemName: "info.circle").foregroundColor(.gray)
                }.padding(.horizontal)
                
            }.padding(.bottom).background(Color.white).cornerRadius(10).shadow(radius: 5).animation(.interactiveSpring()).offset(x: self.translation.width, y: 0)
                //   .rotationEffect(Angle(degrees: Double(self.translation.width / UIScreen.main.bounds.width) * 30), anchor: .bottom)
                .rotationEffect(.degrees(Double(self.translation.width / geometry.size.width) * 15), anchor: .bottom).gesture(DragGesture().onChanged { value in
                            self.translation = value.translation
                            
                            if (self.getGesturePercentage(geometry, from: value)) >= self.thresholdPercentage {
                                self.swipeStatus = .like
                            } else if self.getGesturePercentage(geometry, from: value) <= -self.thresholdPercentage {
                                self.swipeStatus = .dislike
                            } else {
                                self.swipeStatus = .none
                            }
                            
                    }.onEnded { value in
                        // determine snap distance > 0.5 aka half the width of the screen
                        if abs(self.getGesturePercentage(geometry, from: value)) > self.thresholdPercentage {
                            self.onRemove(self.person)
                        } else {
                            self.translation = .zero
                           
                        }
                }).padding()
            
            
            
        }.padding(.leading, 15).padding(.trailing, 15)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(person: Person(name: "Test", work: "iOS Developer", image: "person_4", age: 33), onRemove: { removedPerson in
            print(removedPerson.name)
        })
    }
}
