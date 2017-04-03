//
//  DateFormatTransform.swift
//  CatalogApplication
//
//  Created by Alejos on 4/3/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import ObjectMapper

class DateFormatterTransform: TransformType {
    public typealias Object = String
    public typealias JSON = String
    
    open func transformFromJSON(_ value: Any?) -> String? {
        if let apiString = value {
            let apiDateFormatter = DateFormatter()
            apiDateFormatter.dateFormat = "y-MM-dd"
            let date = apiDateFormatter.date(from: String(describing:apiString))
            let appDateFormatter = DateFormatter()
            appDateFormatter.dateFormat = "MMMM dd, y"
            let appString = appDateFormatter.string(from: date!)
            return appString
        } else {
            return nil
        }
    }
    
    open func transformToJSON(_ value: String?) -> String? {
        if let appString = value {
            let appDateFormatter = DateFormatter()
            appDateFormatter.dateFormat = "MMMM dd, y"
            let date = appDateFormatter.date(from: appString)
            let apiDateFormatter = DateFormatter()
            apiDateFormatter.dateFormat = "y-MM-dd"
            let apiString = apiDateFormatter.string(from: date!)
            return apiString
        } else {
            return nil
        }
    }
}
