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
        var realmArray: [Movie] = []
        let movies = realm.objects(Movie.self)
        if movies.count > offset+offsetSize {
            realmArray = Array(movies[0..<offset+offsetSize])
        } else if movies.count >= offset {
            realmArray = Array(movies[0..<offset])
        }
        MoviesService.getMovies(from: offset) { (moviesJSON, error) in
            if moviesJSON != nil {
                guard let arrayJSON = moviesJSON![jsonKey] as? Array<Dictionary<String, Any>> else {
                    onComplete(nil, wrongContentError);
                    return
                }
                let moviesArray = Mapper<Movie>().mapArray(JSONArray: arrayJSON)
                if let moviesArray = moviesArray {
                    for movie in moviesArray {
                        movie.id = generateID(movie: movie)
                        try! realm.write() {
                            realm.add(movie, update: true)
                        }
                    }
                }
                let movies = realm.objects(Movie.self)
                realmArray = Array(movies[0..<offset+offsetSize])
                onComplete(realmArray, nil)
            } else {
                onComplete(nil, error)
            }        
        }
    }
    
    static func generateID(movie: Movie) -> String {
        let idString = "\(movie.title)\(movie.headline)"
        let utf8str = idString.data(using: String.Encoding.utf8)
        if let base64Encoded = utf8str?.base64EncodedString(){
            return base64Encoded
        }
        return ""
    }
}
