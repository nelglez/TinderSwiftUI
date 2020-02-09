//
//  Person.swift
//  TinderSwiftUI
//
//  Created by Nelson Gonzalez on 2/5/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import Foundation

struct Person : Identifiable{
       var id = UUID()
       var name: String
       var work : String
       var image: String
       var age: Int
   }
