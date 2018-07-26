//
//  Concentration.swift
//  Concentration
//
//  Created by Ahmed Mostafa on 25.07.18.
//  Copyright © 2018 Ahmed Mostafa. All rights reserved.
//

import Foundation

class Concentration{
    
    var cards = [Card]()
    
    func chooseCard(at index:Int){
        if cards[index].isFacedUp{
            cards[index].isFacedUp = false
        }
        else{
            cards[index].isFacedUp = true
        }
    }
    
    init(numberOfPairsOfCards: Int) {
       for _ in 1...numberOfPairsOfCards{
            let card = Card()
            cards += [card,card]
        }
        //TODO: Shuffle the cards 
    }
}
