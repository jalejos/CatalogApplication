//
//  BooksViewController.swift
//  CatalogApplication
//
//  Created by Alejos on 3/28/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import UIKit

class BooksViewController: MediaTableViewController {

    var books: [Book]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        BooksDataLayer.getBooks(from: 0) { (books, error) in
            if let books = books {
                self.books = books
                self.tableView.reloadData()
            } else {
                print(error ?? "Error getting movies data")
            }
        }
    }
    
}

extension BooksViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let books = books {
            return books.count
        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MediaCell", for: indexPath) as! MediaTableViewCell
        if let books = books {
            cell.configureBookCell(book: books[indexPath.row])
        }
        return cell
    }
}
