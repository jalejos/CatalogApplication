//
//  MediaDetailsViewController.swift
//  CatalogApplication
//
//  Created by Alejos on 3/28/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import UIKit
import AlamofireImage
import DTPhotoViewerController

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
    let defaultBookImageName = "book-icon"
    let selectionSegue = "WebSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let object = object as? ListObject{
            configWith(object: object)
            if let movie = object as? Movie {
                configWithMovie(movie: movie)
            } else if let book = object as? Book {
                configWithBook(book: book)
            } else if let object = object as? TopObject {
                configWithTop(object: object)
            }
        }
        checkHyperlinkButtonStatus()
        configPreviewImageView()
        // Do any additional setup after loading the view.
    }
    
    func configWith(object: ListObject) {
        titleLabel.text = object.title
        directorLabel.text = object.author
        dateLabel.text = object.date
        descriptionTextView.text = object.summary
        linkURL = object.articleURL
        if let url = object.imageURL {
            previewImageView.af_setImage(withURL: url)
        }
    }
    
    func configWithMovie(movie: Movie) {
        var rating: String
        if movie.rating.isEmpty {
            rating = "N/A"
        } else {
            rating = movie.rating
        }
        ratingLabel.text = "Rating: \(rating)"
    }
    
    func configWithBook(book: Book) {
        var rating: String
        if book.rating.isEmpty {
            rating = "N/A"
        } else {
            rating = book.rating
        }
        ratingLabel.text = "Rating: \(rating)"
        
        previewImageView.image = UIImage.init(named: defaultBookImageName)
    }
    
    func configWithTop(object: ListObject) {
        ratingLabel.text = ""
    }
}

extension MediaDetailsViewController {
    func checkHyperlinkButtonStatus(){
        if let url = linkURL {
            if !url.path.isEmpty {
                hyperlinkButton.isHidden = false
                return
            }
        }
        hyperlinkButton.isHidden = true
    }
}


extension MediaDetailsViewController {
    func configPreviewImageView() {
        let gestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        previewImageView.isUserInteractionEnabled = true
        previewImageView.addGestureRecognizer(gestureRecognizer)
    }
    
    func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        if previewImageView.image != UIImage.init(named: defaultBookImageName) {
            if let viewController = DTPhotoViewerController(referencedView: previewImageView, image: previewImageView.image) {
                self.navigationController?.present(viewController, animated: true)
            }
        }
    }
}

extension MediaDetailsViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == selectionSegue {
            let webDisplay = segue.destination as! WebViewController
            webDisplay.url = linkURL
        }
    }
}
