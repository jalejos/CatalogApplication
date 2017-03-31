//
//  ProfileViewController.swift
//  CatalogApplication
//
//  Created by Alejos on 3/24/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import UIKit
import AlamofireImage
import FacebookCore
import FBSDKLoginKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var logoutButton: FBSDKLoginButton!
    
    let logoutSegue = "logoutSegue"

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
                        if let id = responseDictionary["id"] {
                            let url = URL.init(string: "http://graph.facebook.com/\(id)/picture?type=large&return_ssl_resources=1")
                            if let url = url {
                                self.profileImageView.af_setImage(withURL: url)
                            }
                        }
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
        logoutButton.readPermissions =  ["public_profile", "email"]
        logoutButton.delegate = LoginHandler.sharedInstance
        LoginHandler.sharedInstance.onLogoutComplete = { self.userLoggedOut() }
    }
    
    func userLoggedOut() {
        self.performSegue(withIdentifier: logoutSegue, sender: self)
    }
}
