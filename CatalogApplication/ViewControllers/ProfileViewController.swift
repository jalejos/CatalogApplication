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
        configureView()
        setupLogoutButton()
    }
    
    func configureView() {
        if let accessToken = AccessToken.current {
            let req = GraphRequest(graphPath: "me", parameters: ["fields":"email, name"], accessToken: accessToken, httpMethod: .GET, apiVersion: 2.8)
            req.start({ (connection, result) in
                switch result {
                case .success(let graphResponse):
                    if let responseDictionary = graphResponse.dictionaryValue {
                        self.nameLabel.text = responseDictionary["name"] as? String
                        self.emailLabel.text = responseDictionary["email"] as? String
                    }
                    break
                case .failed(let error):
                    print(error)
                    break
                }
            })
        }
    }
    
    func setupLogoutButton() {
        let loginButton = LoginButton(readPermissions: [.publicProfile, .email])
        loginButton.center = view.center
        loginButton.delegate = LoginHandler.sharedInstance
        LoginHandler.sharedInstance.onLogoutComplete = { self.userLoggedOut() }
        view.addSubview(loginButton)
    }
    
    func userLoggedOut() {
        self.performSegue(withIdentifier: "logoutSegue", sender: self)
    }
}
