//
//  Player.swift
//  Project34
//
//  Created by Davy Chuon on 6/9/23.
//

import GameplayKit
import UIKit

class Player: NSObject, GKGameModelPlayer {
    static var allPlayers = [Player(chip: .red), Player(chip: .black)]
    
    var chip: ChipColor
    var color: UIColor
    var name: String
    var playerId: Int
    
    var opponent: Player {
        if chip == .red {
            return Player.allPlayers[1]
        } else {
            return Player.allPlayers[0]
        }
    }
    
    init(chip: ChipColor) {
        self.chip = chip
        self.playerId = chip.rawValue
        
        if chip == .red {
            color = .red
            name = "Red"
        } else {
            color = .black
            name = "Black"
        }
        
        super.init()
    }
}
