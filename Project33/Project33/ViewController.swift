//
//  ViewController.swift
//  Project33
//
//  Created by Davy Chuon on 6/7/23.
//

import UIKit

class ViewController: UIViewController {
    static var isDirty = true

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "What's the Whistle?"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addWhistle))
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Home", style: .plain, target: nil, action: nil)
    }
    
    @objc func addWhistle() {
        let vc = RecordWhistleViewController()
        navigationController?.pushViewController(vc, animated: true)
    }


}

