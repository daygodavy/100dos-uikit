//
//  ViewController.swift
//  MilestoneProject1-3
//
//  Created by Davy Chuon on 2/13/23.
//

import UIKit

class ViewController: UITableViewController {
    var origFlagsList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "FLAGS"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasSuffix("2x.png") {
                origFlagsList.append(item)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = origFlagsList[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
            
            
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Flag", for: indexPath)
        
        cell.imageView?.image = UIImage(named: origFlagsList[indexPath.row])
        cell.imageView?.layer.borderWidth = 0.5
        cell.imageView?.layer.borderColor = UIColor.black.cgColor
        
        cell.textLabel?.text = String(origFlagsList[indexPath.row].split(separator: "@").first!).uppercased()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return origFlagsList.count
    }
    


}

