//
//  Service.swift
//  CatalogApplication
//
//  Created by Alejos on 3/30/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import Foundation
import Alamofire

class Service {
    static let noContentError = NSError.init(domain: "", code: 204, userInfo: nil)
    
    static func handleResponse(response: DataResponse<Any>, onComplete: (_ json: Dictionary<String, Any>?, _ error: Error?) -> Void) {
        if let JSON = response.result.value as? Dictionary<String, Any> {
            onComplete(JSON, nil)
        } else if let error = response.error {
            onComplete(nil, error)
        } else {
            onComplete(nil, noContentError)
        }
    }
}
