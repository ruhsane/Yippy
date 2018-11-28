//
//  DisplayReviewViewController.swift
//  Yippy
//
//  Created by Ryan Nguyen on 11/27/18.
//  Copyright © 2018 underwaterSquad. All rights reserved.
//

import UIKit

class DisplayReviewViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!

    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBAction func saveButton(_ sender: Any) {
    }
    
    var review: Reviews?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        modularReviewTitle()
    }
    
    func modularReviewTitle() {
        if let reviewTitle = review?.title {
            self.title = reviewTitle
        } else {
            self.title = "Create a Review"
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier,
            let destination = segue.destination as? TableViewController
            else { return }
        
        switch identifier {
        case "save" where review != nil:
            review?.title = titleTextField.text ?? ""
            review?.content = descriptionTextView.text ?? ""
            
            destination.tableView.reloadData()
            
        case "save" where review == nil:
            let review = Reviews()
            review.title = titleTextField.text ?? ""
            review.content = descriptionTextView.text ?? ""
            review.modificationTime = Date()
            
            destination.reviews.append(review)


            
        case "cancel":
            print("cancel bar button item tapped")
            
        default:
            print("unexpected segue identifier")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let review = review {
            titleTextField.text = review.title
            descriptionTextView.text = review.content
        } else {
            titleTextField.text = ""
            descriptionTextView.text = ""
        }
    }
}
