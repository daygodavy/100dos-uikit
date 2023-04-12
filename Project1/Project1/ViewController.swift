//
//  ViewController.swift
//  Project1
//
//  Created by Davy Chuon on 2/8/23.
//

import UIKit

class ViewController: UITableViewController {
    var pictures =  [String]()
    var picturesViewCount = [String: Int]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(recommendTapped))
        
        performSelector(inBackground: #selector(importPhotos), with: nil)
        
        let userDefaults = UserDefaults.standard
        picturesViewCount = userDefaults.object(forKey: "ViewCount") as? [String: Int] ?? [String: Int]()
        
    }
    
    @objc func importPhotos() {
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                // this is a picture to load
                pictures.append(item)
            }
        }
        pictures = pictures.sorted()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = "Picture \(indexPath.row + 1) of \(pictures.count) - View count: \(picturesViewCount[pictures[indexPath.row], default: 0])"
        cell.detailTextLabel?.text = "View count: \(picturesViewCount[pictures[indexPath.row], default: 0])"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            picturesViewCount[pictures[indexPath.row], default: 0] += 1
            saveViewCount()
            tableView.reloadData()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func recommendTapped() {
        let recommendMessage = "Love this app. Check it out!"
        let recommendLink = "https://apps.apple.com/us/app/facebook/id284882215"
        let vc = UIActivityViewController(activityItems: [recommendMessage, recommendLink], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
        
    }
    
    func saveViewCount() {
        let userDefaults = UserDefaults.standard
        userDefaults.set(picturesViewCount, forKey: "ViewCount")
    }
}

