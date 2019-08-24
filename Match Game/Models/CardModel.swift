//
//  Card.swift
//  Match Game
//
//  Created by Alex Lopez on 24/08/2019.
//  Copyright © 2019 Alex Lopez. All rights reserved.
//

import Foundation

class CardModel {
    
    func getCards() -> [Card] {
        
        var generatedCardsArray = [Card]()
        
        for _ in 1...8 {
            
            let randomNumber = arc4random_uniform(13) + 1
            
            let cardOne = Card()
            cardOne.imageName = "card\(randomNumber)"
            generatedCardsArray.append(cardOne)
            
            let cardTwo = Card()
            cardTwo.imageName = "card\(randomNumber)"
            generatedCardsArray.append(cardTwo)
        }
        
        return generatedCardsArray
    }
    
}
