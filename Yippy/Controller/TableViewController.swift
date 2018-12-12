//
//  TableViewController.swift
//  Yippy
//
//  Created by Ryan Nguyen on 11/27/18.
//  Copyright © 2018 underwaterSquad. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func profileButton(_ sender: Any) {
        let viewController: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProfileViewController") as UIViewController
        
        self.present(viewController, animated: false, completion: nil)
    }
    
    @IBAction func unwindWithSegue(_ segue: UIStoryboardSegue) {
        
    }
    var reviews = [Reviews]() {
        didSet {
            tableView.reloadData()
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
        navigationController?.navigationBar.barTintColor = UIColor(red:0.71, green:0.89, blue:0.98, alpha:1.0)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.foregroundColor : UIColor.blue, NSAttributedString.Key.font : UIFont(name: "Optima-Bold", size: 30)!]
        



    }
    
}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return reviews.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewTableViewCell", for: indexPath) as! ListReviewTableViewCell

        let review = reviews[indexPath.row]
        cell.reviewTitleLabel.text = review.title
        cell.locationTitleLabel.text = review.location
        cell.lastModificationLabel.text = review.modificationTime.stringValue
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
        case "displayReview":
            
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            
            let review = reviews[indexPath.row]
            let destination = segue.destination as! DisplayReviewViewController
            destination.review = review
            
            print("review cell tapped")
            
        case "addReview":
            print("create review bar button item tapped")
            
        case "profile":
            print("We in bois")
            
        default:
            print("unexpected segue identifier")
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            reviews.remove(at: indexPath.row)

        }
    }

}
