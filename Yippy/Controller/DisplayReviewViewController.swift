//
//  DisplayReviewViewController.swift
//  Yippy
//
//  Created by Ryan Nguyen on 11/27/18.
//  Copyright © 2018 underwaterSquad. All rights reserved.
//

import UIKit
import Firebase

class DisplayReviewViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!

    @IBOutlet weak var locationTextField: UITextField!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBAction func saveButton(_ sender: Any) {
    }
    
    var review: Reviews?
    var refReviews: DatabaseReference!
    
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
        
        let user = Auth.auth().currentUser
        refReviews = Database.database().reference().child("Reviews").child((user!.uid))

        switch identifier {
        case "save" where review != nil:
            review?.title = titleTextField.text ?? ""
            review?.location = locationTextField.text ?? ""
            review?.content = descriptionTextView.text ?? ""
            review?.modificationTime = Date()
            
            let key = refReviews.childByAutoId().key
            var reviewData = ["id":key,
                          "title" : titleTextField.text ?? "",
                          "location" : locationTextField.text ?? "",
                          "content" : descriptionTextView.text ?? "",
//                          "modificationTime" : Date()
                ] as [String : Any]

            refReviews.child(key!).setValue(reviewData)
            destination.tableView.reloadData()

//        case "save" where review != nil:
//            review?.title = titleTextField.text ?? ""
//            review?.location = locationTextField.text ?? ""
//            review?.content = descriptionTextView.text ?? ""
//
//
//            destination.tableView.reloadData()
            
        case "save" where review == nil:
            let review = Reviews()
            review.title = titleTextField.text ?? ""
            review.location = locationTextField.text ?? ""
            review.content = descriptionTextView.text ?? ""
            review.modificationTime = Date()
            
            let key = refReviews.childByAutoId().key
            var reviewData = ["id": key,
                          "title" : titleTextField.text ?? "",
                          "location" : locationTextField.text ?? "",
                          "content" : descriptionTextView.text ?? "",
//                          "modificationTime" : Date()
                ] as [String : Any]

            refReviews.child(key!).setValue(reviewData)
            
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
            locationTextField.text = review.location
            descriptionTextView.text = review.content
        } else {
            titleTextField.text = ""
            locationTextField.text = ""
            descriptionTextView.text = ""
        }
    }
}
