//
//  BookViewModel.swift
//  BookTracker
//
//  Created by Ilgın Akgöz on 19.05.2023.
//

import Foundation

struct BookViewModel {
    let bookTitle: String
    let author: String
    let bookCoverImageURL: URL?
    let publisher: String
    let pageCount: Int
    
    public func fetchImage(completion: @escaping (Result<Data, Error>) -> Void) {
         guard let url = bookCoverImageURL else {
             completion(.failure(URLError(.badURL)))
             return
         }
         
         let request = URLRequest(url: url)
         
         let task = URLSession.shared.dataTask(with: request) { data, _, error in
             guard let data = data, error == nil else {
                 completion(.failure(error ?? URLError(.badServerResponse)))
                 return
             }
             completion(.success(data))
         }
         task.resume()
    }
}

