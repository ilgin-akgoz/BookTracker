//
//  Book.swift
//  BookTracker
//
//  Created by Ilgın Akgöz on 26.03.2023.
//

import Foundation

struct Book: Codable {
    let id: String
    let volumeInfo: VolumeInfo
    
    struct VolumeInfo: Codable {
        let title: String?
        let authors: [String]?
        //let publisher: String
        //let publishedDate: String
        //let description: String
        //let pageCount: Int
        //let categories: [String]
        //let averageRating: Double
        let imageLinks: ImageLinks?
    }

    struct ImageLinks: Codable {
        let smallThumbnail: String
        let thumbnail: String
    }
}

struct GetBookResponse: Codable {
    let items: [Book]?
}
