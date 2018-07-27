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
    var indexOfOneAndOnlyFacedCard:Int? //optional
    func chooseCard(at index:Int){
//        if cards[index].isFacedUp{
//            cards[index].isFacedUp = false
//        }
//        else{
//            cards[index].isFacedUp = true
//        }
        
        if !cards[index].isMatched{
            
            if let matchedIndex = indexOfOneAndOnlyFacedCard ,  matchedIndex != index{
                // check if cards matched
                if cards[matchedIndex].identifire == cards[index].identifire{
                    cards[matchedIndex].isMatched=true
                    cards[index].isMatched=true
                }
                cards[index].isFacedUp=true
                indexOfOneAndOnlyFacedCard=nil
            }else{
                //either two cards or one card are matched
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFacedUp=false
                }
                cards[index].isFacedUp=true
                indexOfOneAndOnlyFacedCard = index
            }
        }
        
    }
    
    init(numberOfPairsOfCards: Int) {
       for _ in 1...numberOfPairsOfCards{
            let card = Card()
            cards += [card,card]
        }
        
        for index in cards.indices{
            let randomIndex = Int (arc4random_uniform(UInt32(cards.count)))
            cards.swapAt(index, randomIndex)
        }
        
        //TODO: Shuffle the cards 
    }
}
