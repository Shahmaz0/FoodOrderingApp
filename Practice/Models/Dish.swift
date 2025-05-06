//
//  Dish.swift
//  Practice
//
//  Created by $HahMa on 04/05/25.
//

import Foundation

struct Dish: Codable{
    let id, name, description, image : String?
    let calories: Int?
    
    var formattedCalories: String {
        return ("\(calories ?? 0) calories")
    }
}
