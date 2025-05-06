//
//  DishCategory.swift
//  Practice
//
//  Created by $HahMa on 03/05/25.
//

import Foundation

struct DishCategory: Codable{
    let id, name, image: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "title"
        case image
    }
}
