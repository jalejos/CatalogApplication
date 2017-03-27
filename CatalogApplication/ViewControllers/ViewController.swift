//
//  ViewController.swift
//  CatalogApplication
//
//  Created by Alejos on 3/23/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin

class ViewController: UIViewController {

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
        let loginButton = LoginButton(readPermissions: [.publicProfile])
        loginButton.center = view.center
        loginButton.delegate = self
        view.addSubview(loginButton)
    }
    
    func userLoggedIn() {
        self.performSegue(withIdentifier: "loginSegue", sender: self)
    }

}

extension ViewController: LoginButtonDelegate {
    func loginButtonDidCompleteLogin(_ loginButton: LoginButton, result: LoginResult) {
        userLoggedIn()
    }
    
    func loginButtonDidLogOut(_ loginButton: LoginButton) {
        
    }
}

extension ViewController {
     @IBAction func unwindToMenu(segue: UIStoryboardSegue) {}
}
