//
//  Movie.swift
//  CatalogApplication
//
//  Created by Alejos on 3/27/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import Foundation
import ObjectMapper

class Movie: Mappable {
    var title: String = ""
    var date: String = ""
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        title <- (map["display_title"])
        date <- (map["publication_date"])
    }
}
