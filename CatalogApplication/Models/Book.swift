//
//  Book.swift
//  CatalogApplication
//
//  Created by Alejos on 3/28/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import Foundation
import ObjectMapper

class Book: ListObject {
    var rating: String = ""
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    override func mapping(map: Map) {
        title <- (map["title"])
        date <- (map["ranks_history.0.published_date"])
        author <- (map["author"])
        rating <- (map["age_group"])
        summary <- (map["description"])
        articleURL <- (map["reviews.0.sunday_review_link"], transformURL)
    }
}
