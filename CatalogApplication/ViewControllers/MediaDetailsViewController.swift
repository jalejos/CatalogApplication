//
//  MediaDetailsViewController.swift
//  CatalogApplication
//
//  Created by Alejos on 3/28/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import UIKit
import AlamofireImage

class MediaDetailsViewController: UIViewController {

    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var hyperlinkButton: UIButton!
    
    var object: Any?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let movie = object as? Movie {
            titleLabel.text = movie.title
            dateLabel.text = movie.date
            if let url = movie.imageURL {
                previewImageView.af_setImage(withURL: url)
            }
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
