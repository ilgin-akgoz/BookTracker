//
//  SearchCollectionViewCellViewModel.swift
//  BookTracker
//
//  Created by Ilgın Akgöz on 5.04.2023.
//

import Foundation

final class SearchCollectionViewCellViewModel {
    public let bookTitle: String
    public let author: String
    private var bookCoverImageURL: URL?
    
    init(bookTitle: String, author: String, bookCoverImageURL: URL?) {
        self.bookTitle = bookTitle
        self.author = author
        self.bookCoverImageURL = bookCoverImageURL
    }
    
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
