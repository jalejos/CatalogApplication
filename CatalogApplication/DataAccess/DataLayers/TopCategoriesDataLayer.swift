//
//  TopCategoriesDataLayer.swift
//  CatalogApplication
//
//  Created by Alejos on 3/29/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import Foundation
import ObjectMapper

struct TopCategoriesDataLayer {
    
    static let wrongContentError = NSError.init(domain: "", code: 204, userInfo: nil)
    
    static func getTop(category: Categories, onComplete: @escaping (_ objects: [ListObject]?, _ error: Error?) -> Void) {
        TopCategoriesService.getTop(category: category) { (categoriesJSON, error) in
            if categoriesJSON != nil {
                guard let arrayJSON = categoriesJSON!["results"] as? Array<Dictionary<String, Any>> else {
                    onComplete(nil, wrongContentError);
                    return
                }
                let objects = Mapper<ListObject>().mapArray(JSONArray: arrayJSON)
                onComplete(objects, nil)
            } else {
                onComplete(nil, error)
            }
        }
    }
}
