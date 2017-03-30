//
//  MediaTableViewController.swift
//  CatalogApplication
//
//  Created by Alejos on 3/27/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import UIKit

class MediaTableViewController: UITableViewController {

    let objectNibName = "MediaTableViewCell"
    let mediaCellId = "MediaCell"
    let loadNibName = "LoadTableViewCell"
    let loadCellId = "LoadCell"
    let estimatedCellHeight = CGFloat(70)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: objectNibName, bundle: nil), forCellReuseIdentifier: mediaCellId)
        tableView.register(UINib(nibName: loadNibName, bundle: nil), forCellReuseIdentifier: loadCellId)
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = estimatedCellHeight
    }

    // MARK: - Table view data source

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
