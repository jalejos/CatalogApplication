//
//  MediaTableViewCell.swift
//  CatalogApplication
//
//  Created by Alejos on 3/27/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import UIKit
import AlamofireImage

class MediaTableViewCell: UITableViewCell {

    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    let defaultBookImageName = "book-icon"
    
    func configureCell(_ object: Any) {
        if let object = object as? ListObject {
            titleLabel.text = object.title
            dateLabel.text = object.date
            if let _ = object as? Book {
                previewImageView.image = UIImage.init(named: defaultBookImageName)
            } else {
                if let url = object.imageURL {
                    previewImageView.af_setImage(withURL: url)
                }
            }
        }
    }
}
