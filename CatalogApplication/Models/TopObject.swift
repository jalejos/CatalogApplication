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
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    override func mapping(map: Map) {
        title <- (map["title"])
        date <- (map["published_date"])
        author <- (map["byline"])
        summary <- (map["abstract"])
        articleURL <- (map["url"], transformURL)
        imageURL <- (map["media.0.media-metadata.2.url"], transformURL)
    }
}
