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
    dynamic var id: String = ""
    dynamic var rating: String = ""
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    
    override static func primaryKey() -> String {
        return "id"
    }
    
    override func mapping(map: Map) {
        id <- (map["isbns.0.isbn10"])
        title <- (map["title"])
        date <- (map["ranks_history.0.published_date"], DateFormatterTransform())
        author <- (map["author"])
        rating <- (map["age_group"])
        summary <- (map["description"])
        articleString <- (map["reviews.0.sunday_review_link"])
    }
}
