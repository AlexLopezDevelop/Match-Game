//
//  CardCollectionViewCell.swift
//  Match Game
//
//  Created by Alex Lopez on 24/08/2019.
//  Copyright © 2019 Alex Lopez. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var frontImageView: UIImageView!
    @IBOutlet weak var backImageView: UIImageView!
    
    var card: Card?
    
    func setCard(_ card: Card) {
        
        self.card = card
        
        frontImageView.image = UIImage(named: card.imageName)
        
        if card.isFlipped {
            
            UIView.transition(from: backImageView, to: frontImageView, duration: 0, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
            
        } else {
            
            UIView.transition(from: frontImageView, to: backImageView, duration: 0, options: [.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
        }
    }
    
    func flip() {
        
        UIView.transition(from: backImageView, to: frontImageView, duration: 0.3, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
    }
    
    func flipBack() {
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5, execute: {
            
            UIView.transition(from: self.frontImageView, to: self.backImageView, duration: 0.3, options: [.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
        })
    }
    
    func remove() {
        
        backImageView.alpha = 0
        
        UIView.animate(withDuration: 0.3, delay: 0.5, options: .curveEaseOut, animations: {
            
            self.frontImageView.alpha = 0
            
        }, completion: nil)
        
        
    }
}
