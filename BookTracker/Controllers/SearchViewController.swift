//
//  SearchViewController.swift
//  BookTracker
//
//  Created by Ilgın Akgöz on 26.03.2023.
//

import UIKit

final class SearchViewController: UIViewController {
    private let searchListView = SearchListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Search"
        setUpView()
    }
    
    private func setUpView() {
        view.addSubview(searchListView)
        NSLayoutConstraint.activate([
            searchListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            searchListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            searchListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
}
