//
//  CategoryTableViewController.swift
//  CatalogApplication
//
//  Created by Alejos on 3/28/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import UIKit

class CategoryTableViewController: MediaTableViewController {
    
    var tableObjects: [TopObject]?
    var object: TopObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func configureWith(category: Categories) {
        TopCategoriesDataLayer.getTop(category: category) { (objects, error) in
            if objects != nil {
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
        if let tableObjects = tableObjects {
            return tableObjects.count
        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MediaCell", for: indexPath) as! MediaTableViewCell
        if let tableObjects = tableObjects {
            cell.configureGenericCell(object: tableObjects[indexPath.row])
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let tableObjects = tableObjects {
            object = tableObjects[indexPath.row]
            self.performSegue(withIdentifier: "CategorySegue", sender: self)
        }
    }
}

extension CategoryTableViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CategorySegue" {
            let detailsView = segue.destination as! MediaDetailsViewController
            detailsView.object = object
        }
    }
}
