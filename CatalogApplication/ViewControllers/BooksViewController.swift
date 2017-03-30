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
    var book: Book?
    let selectionSegue = "BookSegue"
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MediaTableViewCell
        if let books = books {
            cell.configureCell(books[indexPath.row])
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let books = books {
            book = books[indexPath.row]
            self.performSegue(withIdentifier: selectionSegue, sender: self)
        }
    }
}

extension BooksViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == selectionSegue {
            let detailsView = segue.destination as! MediaDetailsViewController
            detailsView.object = book
        }
    }
}
