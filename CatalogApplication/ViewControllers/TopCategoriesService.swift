//
//  TopCategoriesService.swift
//  CatalogApplication
//
//  Created by Alejos on 3/29/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import Foundation
import Alamofire


struct TopCategoriesService {
    
    static let noContentError = NSError.init(domain: "", code: 204, userInfo: nil)
    
    static func getTop(category: Categories, onComplete: @escaping (_ topCategories: Dictionary<String, Any>?, _ error: Error?) -> Void) {
        Alamofire.request(MediaRouter.getTop(category: category)).responseJSON { (response) in
            if let JSON = response.result.value as? Dictionary<String, Any> {
                onComplete(JSON, nil)
            } else if let error = response.error {
                onComplete(nil, error)
            } else {
                onComplete(nil, noContentError)
            }
        }
    }
}
