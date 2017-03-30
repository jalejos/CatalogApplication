//
//  ListObject.swift
//  CatalogApplication
//
//  Created by Alejos on 3/29/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class ListObject: Object, Mappable {
    dynamic var id: String = ""
    dynamic var title: String = ""
    dynamic var date: String = ""
    dynamic var author: String = ""
    dynamic var summary: String = ""
    dynamic var articleString: String = ""
    dynamic var imageString: String = ""
    
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
    
    override static func indexedProperties() -> [String] {
        return ["title"]
    }
    
    override static func primaryKey() -> String {
        return "id"
    }
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
    }
}
