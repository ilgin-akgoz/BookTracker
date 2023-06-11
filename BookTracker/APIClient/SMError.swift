//
//  SMError.swift
//  BookTracker
//
//  Created by Ilgın Akgöz on 11.06.2023.
//

import Foundation

enum SMError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    
    var description: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .invalidResponse:
            return "Invalid response"
        case .invalidData:
            return "Invalid data"
        }
    }
}
