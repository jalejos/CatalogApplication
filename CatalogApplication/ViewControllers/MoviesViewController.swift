//
//  MoviesViewController.swift
//  CatalogApplication
//
//  Created by Alejos on 3/27/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import UIKit

class MoviesViewController: MediaTableViewController {
    
    var movies: [Movie]?
    var movie: Movie?
    let selectionSegue = "MovieSegue"

    override func viewDidLoad() {
        super.viewDidLoad()
        getMovies()
        print(String(describing: MediaTableViewCell.self))
        // Do any additional setup after loading the view.
    }

    func getMovies(offset: Int = 0) {
        MoviesDataLayer.getMovies(from: offset) { (movies, error) in
            if let movies = movies {
                if let _ = self.movies {
                    self.movies?.append(contentsOf: movies)
                } else {
                    self.movies = movies
                }
                self.tableView.reloadData()
            } else {
                print(error ?? "Error getting movies data")
            }
        }
    }

}

extension MoviesViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let movies = movies {
            return movies.count + 1
        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let movies = movies {
            if indexPath.row < movies.count {
                let mediaCell = tableView.dequeueReusableCell(withIdentifier: MediaTableViewCell.reusableCellID(), for: indexPath) as! MediaTableViewCell
                mediaCell.configureCell(movies[indexPath.row])
                return mediaCell
            } else {
                let loadCell = tableView.dequeueReusableCell(withIdentifier: reusableLoadCellID, for: indexPath)
                return loadCell
            }
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let movies = movies {
            if indexPath.row < movies.count {
                movie = movies[indexPath.row]
                self.performSegue(withIdentifier: selectionSegue, sender: self)
            } else {
                getMovies(offset: movies.count)
            }
        }
    }
}

extension MoviesViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == selectionSegue {
            let detailsView = segue.destination as! MediaDetailsViewController
            detailsView.object = movie
        }
    }
}
