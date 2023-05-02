//
//  TabViewController.swift
//  BookTracker
//
//  Created by Ilgın Akgöz on 26.03.2023.
//

import UIKit

final class TabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        setUpTabs()
    }
    
    private func setUpTabs() {
        let searchVC = SearchViewController()
        let bookshelvesVC = BookshelvesViewController()
        
        searchVC.navigationItem.largeTitleDisplayMode = .automatic
        bookshelvesVC.navigationItem.largeTitleDisplayMode = .automatic

        let nav1 = UINavigationController(rootViewController: searchVC)
        let nav2 = UINavigationController(rootViewController: bookshelvesVC)
        
        nav1.tabBarItem = UITabBarItem(title: "Search",
                                       image: UIImage(systemName: "magnifyingglass"),
                                       tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Bookshelves",
                                       image: UIImage(systemName: "books.vertical"),
                                       tag: 2)
        
        for nav in [nav1, nav2] {
            nav.navigationBar.prefersLargeTitles = true
        }

        setViewControllers([nav1, nav2], animated: true)
    }

}
