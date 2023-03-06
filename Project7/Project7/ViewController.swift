//
//  ViewController.swift
//  Project7
//
//  Created by Davy Chuon on 3/6/23.
//

import UIKit

class ViewController: UITableViewController {
    var petitions = [Petition]()
    var filteredPetitions = [Petition]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // CHALLENGE 1: add credits button in nav bar that shows alert with credits to data
        let creditsBtn = UIBarButtonItem(title: "Credits", style: .plain, target: self, action: #selector(showCredits))
        // CHALLENGE 2: let users filter petitions
        let filterBtn = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(showFilters))
        navigationItem.leftBarButtonItem = creditsBtn
        navigationItem.rightBarButtonItem = filterBtn
        
        let urlString: String
        
        if navigationController?.tabBarItem.tag == 0 {
            urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        } else {
            urlString = "https://www.hackingwithswift.com/samples/petitions-2.json"
        }
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
                return
            }
        }
        showError()
    }
    
    @objc func showFilters() {
        let ac = UIAlertController(title: "Please enter a keyword to filter by:", message: nil, preferredStyle: .alert)
        ac.addTextField()
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        ac.addAction(
            UIAlertAction(title: "OK", style: .default) { [weak self] _ in
                guard let self = self else { return }
                if let filteredString = ac.textFields?.first?.text?.trimmingCharacters(in: .whitespaces) {
                    self.filteredPetitions = self.petitions.filter { petition in
                        let titleMatch = petition.title.localizedCaseInsensitiveContains(filteredString)
                        let bodyMatch = petition.body.localizedCaseInsensitiveContains(filteredString)
                        return titleMatch || bodyMatch
                    }
                    self.tableView.reloadData()
                }
            }
        )
        present(ac, animated: true)
    }
    
    @objc func showCredits() {
        let ac = UIAlertController(title: "Credits", message: "This data comes from the We The People API of the Whitehouse.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Close", style: .default))
        present(ac, animated: true)
    }
    
    func showError() {
        let ac = UIAlertController(title: "Loading error", message: "There was a problem loading the feed; please check your connection and try again.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
            petitions = jsonPetitions.results
            filteredPetitions = petitions
            tableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredPetitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let petition = filteredPetitions[indexPath.row]
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailItem = filteredPetitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }

}

