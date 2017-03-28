//
//  BooksService.swift
//  CatalogApplication
//
//  Created by Alejos on 3/28/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import Foundation
import Alamofire


struct BooksService {
    
    static let noContentError = NSError.init(domain: "", code: 204, userInfo: nil)
    
    static func getBooks(from offset: Int, onComplete: @escaping (_ movies: Dictionary<String, Any>?, _ error: Error?) -> Void) {
        Alamofire.request(MediaRouter.getBooks(offset: offset)).responseJSON { (response) in
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
