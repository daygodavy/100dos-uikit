//
//  ViewController.swift
//  Project2
//
//  Created by Davy Chuon on 2/9/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionsAsked = 0
    
    var highScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countries += ["estonia", "france", "germany",
                      "ireland", "italy", "monaco", "nigeria",
                      "poland", "russia", "spain", "uk", "usa"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        button1.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        button2.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        button3.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let userDefaults = UserDefaults.standard
        highScore = userDefaults.object(forKey: "highScore") as? Int ?? 0
        
        // askQuestion(action: nil)
        askQuestion()
    }
    
//    func askQuestion(action: UIAlertAction!) {
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Score: \(score)", style: .plain, target: self, action: nil)
        
        navigationItem.rightBarButtonItem?.isEnabled = false
        
    }

    @IBAction func flagButtonTapped(_ sender: UIButton) {
        var title: String
        
        questionsAsked += 1
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong, that flag is \(countries[sender.tag].uppercased())"
            score -= 1
        }
        
        var endMessage = "Game Over"
        if questionsAsked == 10 {
            if score > highScore {
                highScore = score
                saveHighScore()
                endMessage = "10 Questions Completed: new high score is \(score)"
            } else {
                endMessage = "10 Questions Completed: your score is \(score)"
            }
            let ac = UIAlertController(title: title, message: endMessage, preferredStyle: .alert)
            
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
            questionsAsked = 0
        } else {
            let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
            
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            
            present(ac, animated: true)
        }
        
    }
    
    func saveHighScore() {
        let userDefaults = UserDefaults.standard
        userDefaults.set(highScore, forKey: "highScore")
    }
    
}

