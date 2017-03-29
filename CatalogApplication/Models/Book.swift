//
//  Book.swift
//  CatalogApplication
//
//  Created by Alejos on 3/28/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import Foundation
import ObjectMapper

class Book: Mappable {
    var title: String = ""
    var date: String = ""
    var author: String = ""
    var rating: String = ""
    var summary: String = ""
    var articleURL: URL? = URL.init(string: "")
    
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
        date <- (map["ranks_history.0.published_date"])
        author <- (map["author"])
        rating <- (map["age_group"])
        summary <- (map["description"])
        articleURL <- (map["reviews.0.sunday_review_link"], transformURL)
    }
}
