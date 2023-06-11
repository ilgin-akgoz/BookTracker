//
//  APIManager.swift
//  BookTracker
//
//  Created by Ilgın Akgöz on 1.04.2023.
//

import Foundation

final class APIManager {
    public static let shared = APIManager()

    func retrieveData(for searchQuery: String) async throws -> BookResponse {
        let starterURL = "https://www.googleapis.com/books/v1/volumes?q="
        let endingURL = "&key=AIzaSyDyM8jARKK05wK5xAjYgOsCqiBddyRokws"
        let searchQuery = searchQuery.replacingOccurrences(of: " ", with: "+")

        let url = starterURL + searchQuery + endingURL

        let response: BookResponse = try await ServiceManager.shared.callService(with: url)
        
        return response
    }
}


