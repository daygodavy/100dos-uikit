//
//  PlayData.swift
//  Project39
//
//  Created by Davy Chuon on 6/14/23.
//

import Foundation

class PlayData {
    var allWords = [String]()
    var wordCounts: NSCountedSet!
    private(set) var filteredWords = [String]()
    
    init() {
        if let path = Bundle.main.path(forResource: "plays", ofType: "txt") {
            if let plays = try? String(contentsOfFile: path) {
                // CharacterSet.alphanumerics.inverted: split on anything that is NOT a letter or number
                allWords = plays.components(separatedBy: CharacterSet.alphanumerics.inverted)
                allWords = allWords.filter { $0 != "" }
                
                wordCounts = NSCountedSet(array: allWords)
                let sorted = wordCounts.allObjects.sorted { wordCounts.count(for: $0) > wordCounts.count(for: $1) }
                allWords = sorted as! [String]
            }
        }
    }
    
    func applyUserFilter(_ input: String) {
        if let userNumber = Int(input) {
            // filter creates an array out of words with a count great or equal to the number the user entered
            applyFilter { self.wordCounts.count(for: $0) >= userNumber }
        } else {
            // filter creates an array out of words that contain the user's text as a substring
            applyFilter { $0.range(of: input, options: .caseInsensitive) != nil}
        }
    }
    
    func applyFilter(_ filter: (String) -> Bool) {
        filteredWords = allWords.filter(filter)
    }
}
