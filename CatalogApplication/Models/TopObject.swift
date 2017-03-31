//
//  TopObject.swift
//  CatalogApplication
//
//  Created by Alejos on 3/30/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import Foundation
import ObjectMapper

class TopObject: ListObject {
    dynamic var id: Int = 0
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    
    override static func primaryKey() -> String {
        return "id"
    }
    
    override func mapping(map: Map) {
        id <- (map["id"])
        title <- (map["title"])
        date <- (map["published_date"], transformDateFormat)
        author <- (map["byline"])
        summary <- (map["abstract"])
        articleString <- (map["url"])
        imageString <- (map["media.0.media-metadata.2.url"])
    }
}
