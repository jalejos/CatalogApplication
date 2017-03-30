//
//  LoginHandler.swift
//  CatalogApplication
//
//  Created by Alejos on 3/30/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import Foundation
import FacebookLogin

struct LoginHandler: LoginButtonDelegate {
    
    static var sharedInstance = LoginHandler()
    var onLoginComplete: (Void) -> (Void) = {}
    var onLogoutComplete: (Void) -> (Void) = {}
    func loginButtonDidCompleteLogin(_ loginButton: LoginButton, result: LoginResult) {
        LoginHandler.sharedInstance.onLoginComplete()
    }
    
    func loginButtonDidLogOut(_ loginButton: LoginButton) {
        LoginHandler.sharedInstance.onLogoutComplete()
    }
}
