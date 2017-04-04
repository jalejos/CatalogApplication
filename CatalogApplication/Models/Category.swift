//
//  Categories.swift
//  CatalogApplication
//
//  Created by Alejos on 3/28/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import Foundation

enum Category: String {
    /*
     * Enum doesn't support case arrays, which is necesarry for the application. If you need to add further cases, add them in the array variable.
     */
    case food = "Food"
    case car = "Automobiles"
    case art = "Arts"
    case movie = "Movies"
    
    static var array: Array<Category> {
        return [.food, .car, .art, .movie]
    }
}
