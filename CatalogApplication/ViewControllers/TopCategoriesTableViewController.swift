//
//  TopCategoriesTableViewController.swift
//  CatalogApplication
//
//  Created by Alejos on 3/28/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import UIKit

class TopCategoriesTableViewController: UITableViewController {
    
    var category: Category?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    func configureTableView() {
        tableView.register(UINib(nibName: CategoryTableViewCell.reusableCellID(), bundle: nil), forCellReuseIdentifier: CategoryTableViewCell.reusableCellID())
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 80
    }
}

// MARK: - Table view data source
extension TopCategoriesTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Category.array.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.reusableCellID(), for: indexPath) as! CategoryTableViewCell
        cell.configWithCategory(category: Category.array[indexPath.row].rawValue)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        category = Category.array[indexPath.row]
        self.performSegue(withIdentifier: SegueHandler.categorySegue.rawValue, sender: self)
    }

}

extension TopCategoriesTableViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueHandler.categorySegue.rawValue {
            let categoryView = segue.destination as! CategoryTableViewController
            if let category = category {
                categoryView.configureWith(category: category) 
            }
        }
    }
}
