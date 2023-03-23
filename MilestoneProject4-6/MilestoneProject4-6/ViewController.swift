//
//  ViewController.swift
//  MilestoneProject4-6
//
//  Created by Davy Chuon on 3/16/23.
//

import UIKit

class ViewController: UITableViewController {
    var shoppingList: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        tableView.reloadData()
    }
    
    func setupView() {
        let addItemBtn = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        let shareListBtn = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareButtonTapped))
        navigationItem.rightBarButtonItems = [shareListBtn, addItemBtn]
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Clear", style: .plain, target: self, action: #selector(clearButtonTapped))
    }
    
    @objc func addButtonTapped() {
        let ac = UIAlertController(title: "Enter shopping list item", message: "", preferredStyle: .alert)
        ac.addTextField()
        let submitAction = UIAlertAction(title: "Submit", style: .default) { [unowned ac] _ in
            let answer = ac.textFields![0].text!
            let checkAnswer = answer.trimmingCharacters(in: .whitespaces)
            if checkAnswer.count < 1 {
                return
            }
            self.shoppingList.insert(answer, at: self.shoppingList.count)
            self.tableView.reloadData()
        }
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    @objc func shareButtonTapped() {
        let listString = shoppingList.joined(separator: "\n")
        let activityVC = UIActivityViewController(activityItems: [listString], applicationActivities: nil)
        present(activityVC, animated: true)
    }
    
    @objc func clearButtonTapped() {
        shoppingList.removeAll()
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = shoppingList[indexPath.row]
        return cell
    }
    
}

