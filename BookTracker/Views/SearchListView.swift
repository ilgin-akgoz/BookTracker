//
//  SearchListView.swift
//  BookTracker
//
//  Created by Ilgın Akgöz on 5.04.2023.
//

import UIKit

final class SearchListView: UIView {
    private let viewModel = SearchListViewViewModel()
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "Search..."
        searchBar.isHidden = false
        searchBar.sizeToFit()
        searchBar.searchBarStyle = .minimal
        return searchBar
    }()
    
    let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        collectionView.isHidden = false
        collectionView.alpha = 1
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(SearchCollectionViewCell.self,
                                forCellWithReuseIdentifier: SearchCollectionViewCell.cellIdentifier)
    
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews(collectionView, spinner, searchBar)
        
        addConstraints()
        
        //spinner.startAnimating()
        viewModel.delegate = self
        searchBar.delegate = viewModel
        setUpCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            searchBar.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            searchBar.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 40),
                
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
                
            collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    private func setUpCollectionView() {
        collectionView.dataSource = viewModel
        collectionView.delegate = viewModel
    }

}

extension SearchListView: SearchListViewViewModelDelegate {
    func willLoadBooks() {
        spinner.startAnimating()
    }
    
    func didLoadBooks() {
        spinner.stopAnimating()
        collectionView.reloadData()
    }
}


