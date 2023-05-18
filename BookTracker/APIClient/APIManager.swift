//
//  APIManager.swift
//  BookTracker
//
//  Created by Ilgın Akgöz on 1.04.2023.
//

import Foundation

final class APIManager {
    public static let shared = APIManager()
    
    func retrieveData(search: String, success: @escaping ((GetBookResponse) -> Void), fail: @escaping ((Error) -> Void)) {
        let starterURL = "https://www.googleapis.com/books/v1/volumes?q="
        let endingURL = "&key=AIzaSyDyM8jARKK05wK5xAjYgOsCqiBddyRokws"
        let search = search.replacingOccurrences(of: " ", with: "+")
        
        let url = starterURL + search + endingURL
        
        ServiceManager.shared.callService(urlString: url) {
            (response: GetBookResponse) in
            success(response)
        } fail: { error in
            fail(error)
        }
    }
}


