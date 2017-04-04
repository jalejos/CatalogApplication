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
        var realmArray: [Book] = []
        let books = realm.objects(Book.self)
        if books.count > offset+20 {
            realmArray = Array(books[0..<offset+20])
        } else if books.count >= offset {
            realmArray = Array(books[0..<offset])
        }
        onComplete(realmArray, nil)
        BooksService.getBooks(from: offset) { (booksJSON, error) in
            if booksJSON != nil {
                guard let arrayJSON = booksJSON![jsonKey] as? Array<Dictionary<String, Any>> else {
                    onComplete(nil, wrongContentError);
                    return
                }
                let booksArray = Mapper<Book>().mapArray(JSONArray: arrayJSON)
                if let booksArray = booksArray {
                    for book in booksArray {
                        book.id = generateID(book: book)
                        try! realm.write() {
                            realm.add(book, update: true)
                        }
                    }
                }
                let books = realm.objects(Book.self)
                realmArray = Array(books[0..<offset+20])
                onComplete(realmArray, nil)
            } else {
                onComplete(nil, error)
            }
        }
    }
    
    static func generateID(book: Book) -> String {
        let idString = "\(book.title)\(book.isbn10)"
        let utf8str = idString.data(using: String.Encoding.utf8)
        if let base64Encoded = utf8str?.base64EncodedString(){
            return base64Encoded
        }
        return ""
    }
}
