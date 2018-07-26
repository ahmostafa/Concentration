//
//  Card.swift
//  Concentration
//
//  Created by Ahmed Mostafa on 25.07.18.
//  Copyright © 2018 Ahmed Mostafa. All rights reserved.
//

import Foundation

struct Card {
    var isFacedUp = false
    var isMatched = false
    var identifire:Int
    
    static var identifireFactory = 0;
    static func getUniqeIdentifire()-> Int{
        identifireFactory += 1
        return identifireFactory
    }
    init(){
        self.identifire = Card.getUniqeIdentifire()
    }
}
