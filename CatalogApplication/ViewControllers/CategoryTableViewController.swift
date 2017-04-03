//
//  CategoryTableViewController.swift
//  CatalogApplication
//
//  Created by Alejos on 3/28/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import UIKit

class CategoryTableViewController: MediaTableViewController {
    
    var tableObjects: [TopObject] = []
    let selectionSegue = "CategorySegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func configureWith(category: Category) {
        TopCategoriesDataLayer.getTop(category: category) { (objects, error) in
            if let objects = objects {
                self.tableObjects = objects
                self.tableView.reloadData()
            } else {
                print(error ?? "Error in category request")
            }
        }
    }
}

extension CategoryTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableObjects.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MediaTableViewCell.reusableCellID(), for: indexPath) as! MediaTableViewCell
        cell.configureCell(tableObjects[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: selectionSegue, sender: tableObjects[indexPath.row])    }
}

extension CategoryTableViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == selectionSegue {
            let detailsView = segue.destination as! MediaDetailsViewController
            detailsView.object = sender as? TopObject
        }
    }
}
