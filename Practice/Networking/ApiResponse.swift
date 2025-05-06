//
//  ApiResponse.swift
//  Practice
//
//  Created by $HahMa on 06/05/25.
//

import Foundation

struct ApiResponse<T: Decodable>: Decodable {
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}
