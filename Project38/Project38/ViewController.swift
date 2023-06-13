//
//  ViewController.swift
//  Project38
//
//  Created by Davy Chuon on 6/13/23.
//

import CoreData
import UIKit

class ViewController: UITableViewController {
    var container: NSPersistentContainer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // creates the persistent container, and must be given the name of the Core Data model file we created
        container = NSPersistentContainer(name: "Project38")
        
        // loads the saved database if it exists, or creates it otherwise
        container.loadPersistentStores { storeDescription, error in
            if let error = error {
                print("Unresolved error: \(error)")
            }
        }
    }
    
    func saveContext() {
        if container.viewContext.hasChanges {
            do {
                try container.viewContext.save()
            } catch {
                print("An error occurred while saving: \(error)")
            }
        }
    }


}

