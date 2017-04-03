//
//  MoviesViewController.swift
//  CatalogApplication
//
//  Created by Alejos on 3/27/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import UIKit

class MoviesViewController: MediaTableViewController {
    
    var movies: [Movie] = []
    let selectionSegue = "MovieSegue"

    override func viewDidLoad() {
        super.viewDidLoad()
        getMovies()
        // Do any additional setup after loading the view.
    }

    func getMovies(offset: Int = 0) {
        MoviesDataLayer.getMovies(from: offset) { (movies, error) in
            if let movies = movies {
                self.movies.append(contentsOf: movies)
                self.tableView.reloadData()
            } else {
                print(error ?? "Error getting movies data")
            }
        }
    }

}

extension MoviesViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count + 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < movies.count {
            let mediaCell = tableView.dequeueReusableCell(withIdentifier: MediaTableViewCell.reusableCellID(), for: indexPath) as! MediaTableViewCell
            mediaCell.configureCell(movies[indexPath.row])
            return mediaCell
        } else {
            let loadCell = tableView.dequeueReusableCell(withIdentifier: reusableLoadCellID, for: indexPath)
            return loadCell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row < movies.count {
            self.performSegue(withIdentifier: selectionSegue, sender: movies[indexPath.row])
        } else {
            getMovies(offset: movies.count)
        }
    }
}

extension MoviesViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == selectionSegue {
            let detailsView = segue.destination as! MediaDetailsViewController
            detailsView.object = sender as? Movie
        }
    }
}
