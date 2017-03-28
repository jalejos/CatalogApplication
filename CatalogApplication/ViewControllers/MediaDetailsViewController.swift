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
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var hyperlinkButton: UIButton!
    
    var object: Any?
    var linkURL: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let movie = object as? Movie {
            titleLabel.text = movie.title
            directorLabel.text = movie.director
            dateLabel.text = movie.date
            descriptionTextView.text = movie.summary
            var rating: String
            if movie.rating.isEmpty {
                rating = "N/A"
            } else {
                rating = movie.rating
            }
            ratingLabel.text = "Rating: \(rating)"
            if let url = movie.imageURL {
                previewImageView.af_setImage(withURL: url)
            }
            linkURL = movie.articleURL
        }
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "WebSegue" {
            let webDisplay = segue.destination as! WebViewController
            webDisplay.url = linkURL
        }
    }
}
