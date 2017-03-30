//
//  MoviesService.swift
//  CatalogApplication
//
//  Created by Alejos on 3/27/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import Foundation
import Alamofire


class MoviesService: Service {
    static func getMovies(from offset: Int, onComplete: @escaping (_ movies: Dictionary<String, Any>?, _ error: Error?) -> Void) {
        Alamofire.request(MediaRouter.getMovies(offset: offset)).responseJSON { (response) in
            handleResponse(response: response, onComplete: onComplete)
        }
    }
}
