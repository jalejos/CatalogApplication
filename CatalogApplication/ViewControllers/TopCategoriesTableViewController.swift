//
//  TopCategoriesTableViewController.swift
//  CatalogApplication
//
//  Created by Alejos on 3/28/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import UIKit

class TopCategoriesTableViewController: UITableViewController {
    
    var category: Categories?
    let localNibName = "CategoryTableViewCell"
    let cellId = "CategoryCell"
    let selectionSegue = "CategorySegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: localNibName, bundle: nil), forCellReuseIdentifier: cellId)
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 80
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Categories.array.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CategoryTableViewCell
        cell.configWithCategory(category: Categories.array[indexPath.row].rawValue)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        category = Categories.array[indexPath.row]
        self.performSegue(withIdentifier: selectionSegue, sender: self)
    }

}

extension TopCategoriesTableViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == selectionSegue {
            let categoryView = segue.destination as! CategoryTableViewController
            if let category = category {
                categoryView.configureWith(category: category) 
            }
        }
    }
}
