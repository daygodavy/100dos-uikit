//
//  PlayData.swift
//  Project39
//
//  Created by Davy Chuon on 6/14/23.
//

import Foundation

class PlayData {
    var allWords = [String]()
    
    
    init() {
        if let path = Bundle.main.path(forResource: "plays", ofType: "txt") {
            if let plays = try? String(contentsOfFile: path) {
                // CharacterSet.alphanumerics.inverted: split on anything that is NOT a letter or number
                allWords = plays.components(separatedBy: CharacterSet.alphanumerics.inverted)
                allWords = allWords.filter { $0 != "" }
            }
        }
    }
}
