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
    
    let loginSegue = "loginSegue"

    @IBOutlet weak var loginButton: FBSDKLoginButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupLoginButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        self.performSegue(withIdentifier: loginSegue, sender: self)
    }

}
extension ViewController {
     @IBAction func unwindToMenu(segue: UIStoryboardSegue) {}
}
