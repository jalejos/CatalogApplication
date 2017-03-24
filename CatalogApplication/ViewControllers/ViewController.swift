//
//  ViewController.swift
//  CatalogApplication
//
//  Created by Alejos on 3/23/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import UIKit
import FacebookLogin

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let loginButton = LoginButton(readPermissions: [.publicProfile])
        loginButton.center = view.center
        loginButton.delegate = self
        view.addSubview(loginButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: LoginButtonDelegate {
    func loginButtonDidCompleteLogin(_ loginButton: LoginButton, result: LoginResult) {
        performSegue(withIdentifier: "loginSegue", sender: self)
    }
    
    func loginButtonDidLogOut(_ loginButton: LoginButton) {
        
    }
}
