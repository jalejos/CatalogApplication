//
//  BooksViewController.swift
//  CatalogApplication
//
//  Created by Alejos on 3/28/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import UIKit

class BooksViewController: MediaTableViewController {

    var books: [Book] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getBooks()
    }
    
    func getBooks(offset: Int = 0) {
        BooksDataLayer.getBooks(from: offset) { (books, error) in
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
        return books.count + 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < books.count {
            let bookCell = tableView.dequeueReusableCell(withIdentifier: MediaTableViewCell.reusableCellID(), for: indexPath) as! MediaTableViewCell
            bookCell.configureCell(books[indexPath.row])
            return bookCell
        } else {
            let loadCell = tableView.dequeueReusableCell(withIdentifier: reusableLoadCellID, for: indexPath)
            return loadCell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row < books.count {
            self.performSegue(withIdentifier: SegueHandler.bookSegue.rawValue, sender: books[indexPath.row])
        } else {
            getBooks(offset: books.count)
        }
    }
}

extension BooksViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueHandler.bookSegue.rawValue {
            let detailsView = segue.destination as! MediaDetailsViewController
            detailsView.object = sender as? Book
        }
    }
}
