//
//  Whistle.swift
//  Project33
//
//  Created by Davy Chuon on 6/8/23.
//

import CloudKit
import UIKit

class Whistle: NSObject {
    var recordID: CKRecord.ID!
    var genre: String!
    var comments: String!
    var audio: URL!
}
