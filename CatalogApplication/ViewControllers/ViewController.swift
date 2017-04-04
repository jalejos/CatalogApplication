//
//  ViewController.swift
//  CatalogApplication
//
//  Created by Alejos on 3/23/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import UIKit
import FacebookCore
import FBSDKLoginKit

class ViewController: UIViewController {

    @IBOutlet weak var loginButton: FBSDKLoginButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLoginButton()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkLoginStatus()
    }

    func checkLoginStatus() {
        if let _ = AccessToken.current {
            userLoggedIn()
        }
    }
    
    func setupLoginButton() {
        loginButton.readPermissions =  ["public_profile", "email"]
        loginButton.delegate = LoginHandler.sharedInstance
        LoginHandler.sharedInstance.onLoginComplete = { self.userLoggedIn() }
    }
    
    func userLoggedIn() {
        self.performSegue(withIdentifier: SegueHandler.loginSegue.rawValue, sender: self)
    }

}
extension ViewController {
     @IBAction func unwindToMenu(segue: UIStoryboardSegue) {}
}
