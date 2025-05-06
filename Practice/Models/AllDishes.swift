//
//  AllDishes.swift
//  Practice
//
//  Created by $HahMa on 06/05/25.
//

import Foundation

struct AllDishes: Codable {
    let categories: [DishCategory]?
    let populars: [Dish]?
    let specials: [Dish]?
}
