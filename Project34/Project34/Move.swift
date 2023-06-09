//
//  Move.swift
//  Project34
//
//  Created by Davy Chuon on 6/9/23.
//

import GameplayKit
import UIKit

class Move: NSObject, GKGameModelUpdate {
    var value: Int = 0
    var column: Int
    
    init(column: Int) {
        self.column = column
    }
}
