//
//  DataLayer.swift
//  CatalogApplication
//
//  Created by Alejos on 3/30/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import Foundation
import RealmSwift

class DataLayer {
    static let wrongContentError = NSError.init(domain: "", code: 204, userInfo: nil)
    static let jsonKey = "results"
    static let offsetSize = 20
    static let realm = try! Realm()
}
