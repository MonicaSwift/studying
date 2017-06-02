//
//  Drink.swift
//  VendingMachine
//
//  Created by celia me on 2017. 5. 19..
//  Copyright © 2017년 celia me. All rights reserved.
//

import Foundation
class Drink {
    var name:String
    var cost:Int
    
    init(){
        name = ""
        cost = 0
    }
    
    init(name:String, cost:Int) {
        self.name = name
        self.cost = cost
    }
}
