//
//  BooksDataLayer.swift
//  CatalogApplication
//
//  Created by Alejos on 3/28/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class BooksDataLayer: DataLayer {
    static func getBooks(from offset: Int, onComplete: @escaping (_ books: [Book]?, _ error: Error?) -> Void) {
        let books = realm.objects(Book.self)
        if books.count > offset + offsetSize {
            let booksArray = Array(books)
            let displayBooksArray = Array(booksArray[offset..<offset+20])
            onComplete(displayBooksArray, nil)
        } else {
            BooksService.getBooks(from: offset) { (booksJSON, error) in
                if booksJSON != nil {
                    guard let arrayJSON = booksJSON![jsonKey] as? Array<Dictionary<String, Any>> else {
                        onComplete(nil, wrongContentError);
                        return
                    }
                    let booksArray = Mapper<Book>().mapArray(JSONArray: arrayJSON)
                    if let booksArray = booksArray {
                        for book in booksArray {
                            try! realm.write() {
                                realm.add(book, update: true)
                            }
                        }
                    }
                    onComplete(booksArray, nil)
                } else {
                    onComplete(nil, error)
                }
            }
        }
    }
}
