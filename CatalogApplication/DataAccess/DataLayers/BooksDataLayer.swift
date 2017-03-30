//
//  BooksDataLayer.swift
//  CatalogApplication
//
//  Created by Alejos on 3/28/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import Foundation
import ObjectMapper

class BooksDataLayer: DataLayer {
    static func getBooks(from offset: Int, onComplete: @escaping (_ books: [Book]?, _ error: Error?) -> Void) {
        BooksService.getBooks(from: offset) { (booksJSON, error) in
            if booksJSON != nil {
                guard let arrayJSON = booksJSON!["results"] as? Array<Dictionary<String, Any>> else {
                    onComplete(nil, wrongContentError);
                    return
                }
                let booksArray = Mapper<Book>().mapArray(JSONArray: arrayJSON)
                onComplete(booksArray, nil)
            } else {
                onComplete(nil, error)
            }
        }
    }
}
