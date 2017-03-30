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
    var rating: String = ""
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    override func mapping(map: Map) {
        title <- (map["display_title"])
        date <- (map["publication_date"])
        imageURL <- (map["multimedia.src"], transformURL)
        author <- (map["byline"])
        rating <- (map["mpaa_rating"])
        summary <- (map["summary_short"])
        articleURL <- (map["link.url"], transformURL)
    }
}
