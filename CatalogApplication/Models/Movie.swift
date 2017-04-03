//
//  Movie.swift
//  CatalogApplication
//
//  Created by Alejos on 3/27/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import Foundation
import ObjectMapper

class Movie: ListObject {
    dynamic var id: String = ""
    dynamic var rating: String = ""
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    override static func primaryKey() -> String {
        return "id"
    }
    
    override func mapping(map: Map) {
        id <- (map["headline"])
        title <- (map["display_title"])
        date <- (map["publication_date"], DateFormatterTransform())
        imageString <- (map["multimedia.src"])
        author <- (map["byline"])
        rating <- (map["mpaa_rating"])
        summary <- (map["summary_short"])
        articleString <- (map["link.url"])
    }
}
