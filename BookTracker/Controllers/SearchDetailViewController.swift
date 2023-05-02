//
//  SearchDetailViewController.swift
//  BookTracker
//
//  Created by Ilgın Akgöz on 20.04.2023.
//

import UIKit

final class SearchDetailViewController: UIViewController {
    public var searchDetailView = SearchDetailView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUpView()
    }
    
    private func setUpView() {
        view.addSubview(searchDetailView)
        NSLayoutConstraint.activate([
            searchDetailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchDetailView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            searchDetailView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            searchDetailView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
