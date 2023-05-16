//
//  ViewController.swift
//  Project18
//
//  Created by Davy Chuon on 5/15/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("I'm inside the viewDidLoad() method.")
        
        print(1, 2, 3, 4, 5, separator: "-")
        
        print("Some message", terminator: "\n")
        
        assert(1 == 1, "Math failure!")
//        assert(1 == 2, "Math failure2!")
        
//        assert(myReallySlowMethod() == true, "The slow method returned false, which is a bad thing.")
        
        for i in 1...100 {
            print("Got number \(i).")
        }
        // lldb "p i" will print value of i
    }


}

