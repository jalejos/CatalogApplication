//
//  Categories.swift
//  CatalogApplication
//
//  Created by Alejos on 3/28/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import Foundation

enum Categories: String {
    /*
     * Enum doesn't support case counting, which is necesarry for the application. If you need to add further cases, add them in the count variable.
     */
    case Food = "Food"
    case Cars = "Automobiles"
    case Arts = "Arts"
    case Movies = "Movies"
    
    static var count: Int {
        let casesArray = [Categories.Food, Categories.Cars, Categories.Arts, Categories.Movies]
        return casesArray.count
    }
    
    static var array: Array<Categories> {
        return [Categories.Food, Categories.Cars, Categories.Arts, Categories.Movies]
    }
}
