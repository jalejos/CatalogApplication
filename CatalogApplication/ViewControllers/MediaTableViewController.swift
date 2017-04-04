//
//  MediaTableViewController.swift
//  CatalogApplication
//
//  Created by Alejos on 3/27/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import UIKit

class MediaTableViewController: UITableViewController {
    
    let estimatedCellHeight = CGFloat(70)
    let reusableLoadCellID = "LoadTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    func configureTableView() {
        tableView.register(UINib(nibName: MediaTableViewCell.reusableCellID(), bundle: nil), forCellReuseIdentifier: MediaTableViewCell.reusableCellID())
        tableView.register(UINib(nibName: reusableLoadCellID, bundle: nil), forCellReuseIdentifier: reusableLoadCellID)
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = estimatedCellHeight
    }
}

// MARK: - Table view data source
extension MediaTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
