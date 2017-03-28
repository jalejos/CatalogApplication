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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureMovieCell(movie: Movie) {
        if let url = movie.imageURL {
            previewImageView.af_setImage(withURL: url)
        }
        titleLabel.text = movie.title
        dateLabel.text = movie.date
    }
    
    func configureBookCell(book: Book) {
        previewImageView.image = UIImage.init(named: "book-icon")
        titleLabel.text = book.title
        dateLabel.text = book.title
    }

}
