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
    
        let transformId = TransformOf<String, Int>(fromJSON: { (value: Int?) -> String? in
            // transform value from Int to String
            if let value = value {
                return String(value)
            }
            return nil
        }, toJSON: { (value: String?) -> Int? in
            // transform value from String to Int
            if let value = value {
                return Int(value)
            }
            return nil
        })
    
    override func mapping(map: Map) {
        id <- (map["id"], transformId)
        title <- (map["title"])
        date <- (map["published_date"], transformDateFormat)
        author <- (map["byline"])
        summary <- (map["abstract"])
        articleString <- (map["url"])
        imageString <- (map["media.0.media-metadata.2.url"])
    }
}
