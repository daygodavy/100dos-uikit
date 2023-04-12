//
//  Person.swift
//  Project10
//
//  Created by Davy Chuon on 4/4/23.
//

import UIKit

class Person: NSObject, Codable {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
