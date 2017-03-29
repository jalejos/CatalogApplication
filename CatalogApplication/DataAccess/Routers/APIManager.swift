//
//  APIManager.swift
//  CatalogApplication
//
//  Created by Alejos on 3/27/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import Foundation

struct APIManager {
    static var serverURL = "http://api.nytimes.com/svc"
    static let apiKey = "1e73df4e96b248d799a4cab2e82350fd"
    static let baseURL = URL(string: serverURL)!
}
