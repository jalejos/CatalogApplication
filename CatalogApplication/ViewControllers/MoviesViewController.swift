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

    override func viewDidLoad() {
        super.viewDidLoad()
        MoviesDataLayer.getMovies(from: 0) { (movies, error) in
            if let movies = movies {
                self.movies = movies
                self.tableView.reloadData()
            } else {
                print(error ?? "Error getting movies data")
            }
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension MoviesViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let movies = movies {
            return movies.count
        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MediaCell", for: indexPath) as! MediaTableViewCell
        if let movies = movies {
            cell.configureCell(movies[indexPath.row])
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let movies = movies {
            movie = movies[indexPath.row]
            self.performSegue(withIdentifier: "MovieSegue", sender: self)
        }
    }
}

extension MoviesViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MovieSegue" {
            let detailsView = segue.destination as! MediaDetailsViewController
            detailsView.object = movie
        }
    }
}
