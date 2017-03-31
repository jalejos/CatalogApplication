//
//  LoginHandler.swift
//  CatalogApplication
//
//  Created by Alejos on 3/30/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import Foundation
import FBSDKLoginKit

class LoginHandler: NSObject, FBSDKLoginButtonDelegate {
    
    static var sharedInstance = LoginHandler()
    var onLoginComplete: (Void) -> (Void) = {}
    var onLogoutComplete: (Void) -> (Void) = {}
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        LoginHandler.sharedInstance.onLoginComplete()
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        LoginHandler.sharedInstance.onLogoutComplete()
    }
}
