//
//  AppError.swift
//  Practice
//
//  Created by $HahMa on 06/05/25.
//

import Foundation


enum AppError: LocalizedError{
    case errorDecoding
    case unknownError
    case invalidURL
    case serverError(String)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Give me a valid url"
        case .serverError(let error):
            return error
        case .errorDecoding:
            return "Response could not be decoded!"
        case .unknownError:
            return "Bruh! i have no idea what's going on."
        }
    }
}
