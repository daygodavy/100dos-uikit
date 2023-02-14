//
//  DetailViewController.swift
//  MilestoneProject1-3
//
//  Created by Davy Chuon on 2/13/23.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImageView()
        setupNavBar()
    }
    
    func setupImageView() {
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
            title = String(imageToLoad.split(separator: "@").first!).uppercased()
        }
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor.black.cgColor
    }
    
    func setupNavBar() {
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
    }
    
    @objc func shareTapped() {
        guard let flagImage = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("Could not retrieve flag data")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [flagImage, title ?? "N/A"], applicationActivities: [])
        present(vc, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
