//
//  ViewController.swift
//  Concentration
//
//  Created by Ahmed Mostafa on 21.07.18.
//  Copyright © 2018 Ahmed Mostafa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }

    lazy var game = Concentration(numberOfPairsOfCards:(cardButtons.count+1)/2)
    var flipCount = 0{
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }

    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    var emojiChoices=["🎃","👻", "😱","😈" ,"🙀" , "🦇", "🍎","🍭" ,"🍬"]
    
    var emoji = [Int:String]()
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1;
       
        if let cardNumber = cardButtons.index(of: sender){
           //flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
            game.chooseCard(at: cardNumber)
            updateViewFromModle()
        }
        
        
    }
    
    func updateViewFromModle()  {
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFacedUp{
                button.setTitle(emoji(for: card), for:UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
            }
            else{
                button.setTitle("", for:UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.9887863248, green: 0, blue: 1, alpha: 0) :  #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
            
        }
    }
    
    func emoji(for card:Card)->String{
//        if  emoji[card.identifire]!=nil{
//            return emoji[card.identifire]!
//        }else
//            return"?"
        if emoji[card.identifire] == nil , emojiChoices.count > 0{
            let randomIndex = Int (arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifire] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifire] ?? "?"
    }
    
//    func flipCard(withEmoji emoji:String, on button:UIButton){
//        if button.currentTitle == emoji{
//            button.setTitle("", for:UIControlState.normal)
//            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
//        }else{
//            button.setTitle(emoji, for:UIControlState.normal)
//            button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
//        }
//    }
}

