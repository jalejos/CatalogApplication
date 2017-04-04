//
//  MoviesDataLayer.swift
//  CatalogApplication
//
//  Created by Alejos on 3/27/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class MoviesDataLayer: DataLayer {
    static func getMovies(from offset: Int, onComplete: @escaping (_ movies: [Movie]?, _ error: Error?) -> Void) {
        let movies = realm.objects(Movie.self)
        if movies.count > offset + offsetSize {
            let moviesArray = Array(movies)
            let displayMoviesArray = Array(moviesArray[offset..<offset+offsetSize])
            onComplete(displayMoviesArray, nil)
        } else {
            MoviesService.getMovies(from: offset) { (moviesJSON, error) in
                if moviesJSON != nil {
                    guard let arrayJSON = moviesJSON![jsonKey] as? Array<Dictionary<String, Any>> else {
                        onComplete(nil, wrongContentError);
                        return
                    }
                    let moviesArray = Mapper<Movie>().mapArray(JSONArray: arrayJSON)
                    if let moviesArray = moviesArray {
                        for movie in moviesArray {
                            try! realm.write() {
                                realm.add(movie, update: true)
                            }
                        }
                    }
                    onComplete(moviesArray, nil)
                } else {
                    onComplete(nil, error)
                }
            }
        }
    }
}
