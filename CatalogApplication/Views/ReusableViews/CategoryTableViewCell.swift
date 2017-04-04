//
//  CategoryTableViewCell.swift
//  CatalogApplication
//
//  Created by Alejos on 3/28/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    static func reusableCellID() -> String {
        return String(describing: self)
    }
    
    func configWithCategory (category: String) {
        categoryLabel.text = category
    }

}
