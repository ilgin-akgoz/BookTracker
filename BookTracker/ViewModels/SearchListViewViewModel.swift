//
//  SearchListViewViewModel.swift
//  BookTracker
//
//  Created by Ilgın Akgöz on 5.04.2023.
//

import UIKit

protocol SearchListViewViewModelDelegate: AnyObject {
    func didLoadInitialBooks()
}

final class SearchListViewViewModel: NSObject, UISearchBarDelegate {
    public weak var delegate: SearchListViewViewModelDelegate?
    private var cellViewModels: [SearchCollectionViewCellViewModel] = []
    private var searchText: String = ""
    
    private var books: [Book] = [] {
        didSet {
            for book in books {
                let title = book.volumeInfo.title
                let author = book.volumeInfo.authors[0]
                var imageURL = book.volumeInfo.imageLinks?.thumbnail ?? "http://icon-library.com/images/small-book-icon/small-book-icon-3.jpg"
                imageURL = imageURL.replacingOccurrences(of: "http", with: "https")
                
                let viewModel = SearchCollectionViewCellViewModel(
                    bookTitle: title,
                    author: author,
                    bookCoverImageURL: URL(string: imageURL)
                )
                
                cellViewModels.append(viewModel)
            }
        }
    }
    
    public func fetchBooks(with: String) {
        APIManager.shared.retrieveData(search: with) { [weak self] response in
            if let result = response.items {
                self?.books = result
                DispatchQueue.main.async {
                    self?.delegate?.didLoadInitialBooks()
                }
            }
        } fail: { error in
            print("Failed with error: \(error.localizedDescription)")
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchText = searchText
    }
        
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
        
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        cellViewModels.removeAll()
        fetchBooks(with: searchText)
    }
    
}

extension SearchListViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: SearchCollectionViewCell.cellIdentifier,
            for: indexPath
        ) as? SearchCollectionViewCell else {
            fatalError("Unsupported cell")
        }
        
        cell.configure(with: cellViewModels[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width - 30) / 2
        
        return CGSize(
            width: width,
            height: width * 1.5
        )
    }
}
