//
//  ViewController.swift
//  Project12
//
//  Created by Davy Chuon on 4/11/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        
        defaults.set(25, forKey: "Age")
        defaults.set(true, forKey: "UseFaceID")
        defaults.set(CGFloat.pi, forKey: "Pi")
        defaults.set("Davy Chuon", forKey: "Name")
        defaults.set(Date(), forKey: "LastRun")
        
        let array = ["Hello", "World"]
        defaults.set(array, forKey: "SavedArray")
        
        let dict = [ "Name": "Davy", "Country": "USA" ]
        defaults.set(dict, forKey: "SavedDictionary")
        
        let savedInteger = defaults.integer(forKey: "Age")
        let savedBoolean = defaults.bool(forKey: "UseFaceID")
        
        let savedArray = defaults.object(forKey: "SavedArray") as? [String] ?? [String]()
        
        let savedDictionary = defaults.object(forKey: "SavedDictionary") as? [String: String] ?? [String: String]()
        
        // defaults.array returns [Any]?, so must be type casted after
//        let savedArray2 = defaults.array(forKey: <#T##String#>)
        
        // defaults.dictionary must have string for keys and returns [String : Any]?
//        let savedDictionary2 = defaults.dictionary(forKey: <#T##String#>)
        
        // defaults.object is more flexible than the above and works for both array and dictionary
        
        
    }


}

