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
    
    let signInButton: GIDSignInButton = {
        let signInButton = GIDSignInButton()
        signInButton.frame = CGRect(x: 200, y: 200, width: 200, height: 200)
        return signInButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(signInButton)
        
        GIDSignIn.sharedInstance().uiDelegate = self
//        GIDSignIn.sharedInstance().delegate = self
//        GIDSignIn.sharedInstance().signIn()
        GIDSignIn.sharedInstance().signInSilently()


    }

    

}

