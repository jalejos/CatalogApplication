//
//  ListObject.swift
//  CatalogApplication
//
//  Created by Alejos on 3/29/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class ListObject: Object, Mappable {
    dynamic var title: String = ""
    dynamic var date: String = ""
    dynamic var author: String = ""
    dynamic var summary: String = ""
    dynamic var articleString: String = ""
    dynamic var imageString: String = ""
    
    override static func indexedProperties() -> [String] {
        return ["title"]
    }
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
    }
}
