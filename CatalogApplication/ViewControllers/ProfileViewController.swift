//
//  ProfileViewController.swift
//  CatalogApplication
//
//  Created by Alejos on 3/24/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLogoutButton()
    }
    
    func setupLogoutButton() {
        let loginButton = LoginButton(readPermissions: [.publicProfile])
        loginButton.center = view.center
        loginButton.delegate = self
        view.addSubview(loginButton)
    }
}

extension ProfileViewController: LoginButtonDelegate {
    
    func loginButtonDidCompleteLogin(_ loginButton: LoginButton, result: LoginResult) {
        
    }
    
    func loginButtonDidLogOut(_ loginButton: LoginButton) {
        self.performSegue(withIdentifier: "logoutSegue", sender: self)
    }
    
}
