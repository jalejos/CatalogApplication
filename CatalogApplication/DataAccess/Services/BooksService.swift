//
//  BooksService.swift
//  CatalogApplication
//
//  Created by Alejos on 3/28/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import Foundation
import Alamofire


class BooksService: Service {
    static func getBooks(from offset: Int, onComplete: @escaping (_ movies: Dictionary<String, Any>?, _ error: Error?) -> Void) {
        Alamofire.request(MediaRouter.getBooks(offset: offset)).responseJSON { (response) in
            handleResponse(response: response, onComplete: onComplete)
        }
    }
}
