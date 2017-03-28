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
    var imageURL: URL? = URL.init(string: "")
    
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
        title <- (map["display_title"])
        date <- (map["publication_date"])
        imageURL <- (map["multimedia.src"], transformURL)
    }
}
