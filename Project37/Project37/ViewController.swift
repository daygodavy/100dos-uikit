//
//  ViewController.swift
//  Project37
//
//  Created by TwoStraws on 25/08/2016.
//  Copyright © 2016 Paul Hudson. All rights reserved.
//

import AVFoundation
import UIKit
import WatchConnectivity

class ViewController: UIViewController {
    @IBOutlet var cardContainer: UIView!
    @IBOutlet var gradientView: GradientView!
    var allCards = [CardViewController]()

    var music: AVAudioPlayer!
    var lastMessage: CFAbsoluteTime = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCards()
        
        view.backgroundColor = UIColor.red
        
        UIView.animate(withDuration: 20, delay: 0, options: [.allowUserInteraction, .autoreverse, .repeat], animations: {
            self.view.backgroundColor = UIColor.blue
        })
        
    }
    
    @objc func loadCards() {
        for card in allCards {
            card.view.removeFromSuperview()
            card.removeFromParent()
        }
        
        allCards.removeAll(keepingCapacity: true)
        
        // create an array of card positions
        let positions = [
            CGPoint(x: 75, y: 85),
            CGPoint(x: 185, y: 85),
            CGPoint(x: 295, y: 85),
            CGPoint(x: 405, y: 85),
            CGPoint(x: 75, y: 235),
            CGPoint(x: 185, y: 235),
            CGPoint(x: 295, y: 235),
            CGPoint(x: 405, y: 235)
        ]
        
        // load and upwrap our Zener card images
        let circle = UIImage(named: "cardCircle")!
        let cross = UIImage(named: "cardCross")!
        let lines = UIImage(named: "cardLines")!
        let square = UIImage(named: "cardSquare")!
        let star = UIImage(named: "cardStar")!
        
        // create an array of the images, one for each card, then shuffle it
        var images = [circle, circle, cross, cross, lines, lines, square, star]
        images.shuffle()
        
        for (index, position) in positions.enumerated() {
            // loop over each card position and create a new card view controller
            let card = CardViewController()
            card.delegate = self
            
            // use view controller containment and also add the card's view to our cardContainer view
            addChild(card)
            cardContainer.addSubview(card.view)
            card.didMove(toParent: self)
            
            // position the card appropriately, then give it an image from our array
            card.view.center = position
            card.front.image = images[index]
            
            // if we just gave the new card the star image, mark this as the correct answer
            if card.front.image == star {
                card.isCorrect = true
            }
            
            // add the new card view controller to our array for easier tracking
            allCards.append(card)
        }
        
        view.isUserInteractionEnabled = true
    }
    
    @objc func cardTapped(_ tapped: CardViewController) {
        guard view.isUserInteractionEnabled == true else { return }
        view.isUserInteractionEnabled = false
        
        for card in allCards {
            if card == tapped {
                card.wasTapped()
                card.perform(#selector(card.wasntTapped), with: nil, afterDelay: 1)
            } else {
                card.wasntTapped()
            }
        }
        
        perform(#selector(loadCards), with: nil, afterDelay: 2)
    }
}


