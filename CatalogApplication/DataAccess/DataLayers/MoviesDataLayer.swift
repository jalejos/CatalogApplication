//
//  MoviesDataLayer.swift
//  CatalogApplication
//
//  Created by Alejos on 3/27/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import Foundation
import ObjectMapper

class MoviesDataLayer: DataLayer {
    static func getMovies(from offset: Int, onComplete: @escaping (_ movies: [Movie]?, _ error: Error?) -> Void) {
        MoviesService.getMovies(from: offset) { (moviesJSON, error) in
            if moviesJSON != nil {
                guard let arrayJSON = moviesJSON![jsonKey] as? Array<Dictionary<String, Any>> else {
                    onComplete(nil, wrongContentError);
                    return
                }
                let moviesArray = Mapper<Movie>().mapArray(JSONArray: arrayJSON)
                onComplete(moviesArray, nil)
            } else {
                onComplete(nil, error)
            }
        }
    }
}
