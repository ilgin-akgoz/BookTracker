//
//  SearchDetailViewViewModel.swift
//  BookTracker
//
//  Created by Ilgın Akgöz on 20.04.2023.
//

import UIKit

final class SearchDetailViewViewModel {
    public var bookTitle: String = ""
    public var author: String = ""
    public var publisher: String = ""
    public var pageCount: Int = 0
    //public var publishedDate: String = ""
    //public var bookDescription: String = ""
    
    init(bookTitle: String, author: String, publisher: String, pageCount: Int) {
        self.bookTitle = bookTitle
        self.author = author
        self.publisher = publisher
        self.pageCount = pageCount
    }
    

}
 

