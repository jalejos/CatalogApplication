//
//  ListObject.swift
//  CatalogApplication
//
//  Created by Alejos on 3/29/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import Foundation
import ObjectMapper

class ListObject: Mappable {
    var title: String = ""
    var date: String = ""
    var author: String = ""
    var summary: String = ""
    var articleURL: URL?
    var imageURL: URL?
    
    let transformURL = TransformOf<URL, String>(fromJSON: { (value: String?) -> URL? in
        // transform value from String to URL
        if let value = value {
            return URL.init(string:value)
        }
        return nil
    }, toJSON: { (value: URL?) -> String? in
        // transform value from URL to String
        if let value = value {
            return value.path
        }
        return nil
    })
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        title <- (map["title"])
        date <- (map["published_date"])
        author <- (map["byline"])
        summary <- (map["abstract"])
        articleURL <- (map["url"], transformURL)
        imageURL <- (map["media.0.media-metadata.2.url"], transformURL)
    }
}
