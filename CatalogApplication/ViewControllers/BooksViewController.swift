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
        getBooks(offset: 0)
    }
    
    func getBooks(offset: Int) {
        BooksDataLayer.getBooks(from: offset) { (books, error) in
            if let books = books {
                if let _ = self.books {
                    self.books?.append(contentsOf: books)
                } else {
                    self.books = books
                }
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
            return books.count + 1
        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let books = books {
            if indexPath.row < books.count {
                let bookCell = tableView.dequeueReusableCell(withIdentifier: mediaCellId, for: indexPath) as! MediaTableViewCell
                bookCell.configureCell(books[indexPath.row])
                return bookCell
            } else {
                let loadCell = tableView.dequeueReusableCell(withIdentifier: loadCellId, for: indexPath)
                return loadCell
            }
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let books = books {
            if indexPath.row < books.count {
                book = books[indexPath.row]
                self.performSegue(withIdentifier: selectionSegue, sender: self)
            } else {
                getBooks(offset: books.count)
            }
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
