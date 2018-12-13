//
//  ProfileViewController.swift
//  Yippy
//
//  Created by Ruhsane Sawut on 12/12/18.
//  Copyright © 2018 underwaterSquad. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn


class ProfileViewController: UIViewController {

    let firebaseAuth = Auth.auth()

    
    @IBAction func signOutButton(_ sender: UIButton) {
        
        do {
            try firebaseAuth.signOut()
//            GIDSignIn.sharedInstance().signOut()
            print("sign out success")
            let viewController: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as UIViewController
            UserDefaults.standard.set(false, forKey: "status")
            self.present(viewController, animated: true, completion: nil)
            Switcher.updateRootVC()
            
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
