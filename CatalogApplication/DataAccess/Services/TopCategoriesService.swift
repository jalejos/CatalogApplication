//
//  TopCategoriesService.swift
//  CatalogApplication
//
//  Created by Alejos on 3/29/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import Foundation
import Alamofire


class TopCategoriesService: Service {
    static func getTop(category: Categories, onComplete: @escaping (_ topCategories: Dictionary<String, Any>?, _ error: Error?) -> Void) {
        Alamofire.request(MediaRouter.getTop(category: category)).responseJSON { (response) in
            handleResponse(response: response, onComplete: onComplete)
        }
    }
}
