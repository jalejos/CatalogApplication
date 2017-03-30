//
//  TopCategoriesDataLayer.swift
//  CatalogApplication
//
//  Created by Alejos on 3/29/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import Foundation
import ObjectMapper

class TopCategoriesDataLayer: DataLayer{
    static func getTop(category: Categories, onComplete: @escaping (_ objects: [TopObject]?, _ error: Error?) -> Void) {
        TopCategoriesService.getTop(category: category) { (categoriesJSON, error) in
            if categoriesJSON != nil {
                guard let arrayJSON = categoriesJSON![jsonKey] as? Array<Dictionary<String, Any>> else {
                    onComplete(nil, wrongContentError);
                    return
                }
                let objects = Mapper<TopObject>().mapArray(JSONArray: arrayJSON)
                onComplete(objects, nil)
            } else {
                onComplete(nil, error)
            }
        }
    }
}
