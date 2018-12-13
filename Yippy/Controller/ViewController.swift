//
//  ViewController.swift
//  Yippy
//
//  Created by Ruhsane Sawut on 11/9/18.
//  Copyright © 2018 underwaterSquad. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class ViewController: UIViewController, GIDSignInUIDelegate {
    
    @IBAction func signedOut(_ segue: UIStoryboardSegue) {
        
    }
    
    let signInButton: GIDSignInButton = {
        let signInButton = GIDSignInButton()
        signInButton.frame = CGRect(x: 200, y: 200, width: 200, height: 200)
        UserDefaults.standard.set(true, forKey: "status")
        Switcher.updateRootVC()
        return signInButton
    }()
    
    let background = UIImageView(image: #imageLiteral(resourceName: "Yippy_Splash.png"))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(background)
        GIDSignIn.sharedInstance().uiDelegate = self
//        GIDSignIn.sharedInstance().signIn()
        view.addSubview(signInButton)
        
        
//        GIDSignIn.sharedInstance().delegate = self
        
//        GIDSignIn.sharedInstance().signInSilently()
        
        constraints()

    }

    

}


extension ViewController {
    
    func constraints() {
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
//        signInButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -100).isActive = true
        signInButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true

        
        background.translatesAutoresizingMaskIntoConstraints = false
        background.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        background.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        background.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        background.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
}
