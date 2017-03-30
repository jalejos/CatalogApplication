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
    
    let transformDateFormat = TransformOf<String, String>(fromJSON: { (value: String?) -> String? in
        // transform value from api format to app format
        if let apiString = value {
            let apiDateFormatter = DateFormatter()
            apiDateFormatter.dateFormat = "y-MM-dd"
            let date = apiDateFormatter.date(from: apiString)
            let appDateFormatter = DateFormatter()
            appDateFormatter.dateFormat = "MMMM dd, y"
            let appString = appDateFormatter.string(from: date!)
            return appString
        }
        return nil
    }, toJSON: { (value: String?) -> String? in
        // transform value from app format to api format
        if let appString = value {
            let appDateFormatter = DateFormatter()
            appDateFormatter.dateFormat = "MMMM dd, y"
            let date = appDateFormatter.date(from: appString)
            let apiDateFormatter = DateFormatter()
            apiDateFormatter.dateFormat = "y-MM-dd"
            let apiString = apiDateFormatter.string(from: date!)
            return apiString
        }
        return nil
    })
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
    }
}
