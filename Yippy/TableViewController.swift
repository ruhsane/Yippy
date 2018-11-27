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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        

        // Do any additional setup after loading the view.
    }
    
}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewTableViewCell", for: indexPath) as! ListReviewTableViewCell
        cell.reviewTitleLabel.text = "Review's title"
        cell.lastModificationLabel.text = "Review's modification time"
        
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        if identifier == "displayReview" {
            print("Transitioning to the Display Review View Controller")
        }
    }

}
