//
//  TopCategoriesDataLayer.swift
//  CatalogApplication
//
//  Created by Alejos on 3/29/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class TopCategoriesDataLayer: DataLayer{
    static func getTop(category: Category, onComplete: @escaping (_ objects: [TopObject]?, _ error: Error?) -> Void) {
        let objects = realm.objects(TopObject.self)
        if objects.count > 0 {
            let objectsArray = Array(objects)
            onComplete(objectsArray, nil)
        }
        TopCategoriesService.getTop(category: category) { (categoriesJSON, error) in
            if categoriesJSON != nil {
                guard let arrayJSON = categoriesJSON![jsonKey] as? Array<Dictionary<String, Any>> else {
                    onComplete(nil, wrongContentError);
                    return
                }
                let objects = Mapper<TopObject>().mapArray(JSONArray: arrayJSON)
                if let objects = objects {
                    for object in objects {
                        try! realm.write() {
                            realm.add(object, update:true)
                        }
                    }
                }
                onComplete(objects, nil)
            } else {
                onComplete(nil, error)
            }
        }
    }
}
