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
        let bookshelfVC = BookshelfViewController()
        
        searchVC.navigationItem.largeTitleDisplayMode = .automatic
        bookshelfVC.navigationItem.largeTitleDisplayMode = .automatic

        let nav1 = UINavigationController(rootViewController: searchVC)
        let nav2 = UINavigationController(rootViewController: bookshelfVC)
        
        nav1.tabBarItem = UITabBarItem(title: "Search",
                                       image: UIImage(systemName: "magnifyingglass"),
                                       tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Bookshelf",
                                       image: UIImage(systemName: "book"),
                                       tag: 2)
        
        for nav in [nav1, nav2] {
            nav.navigationBar.prefersLargeTitles = true
        }

        setViewControllers([nav1, nav2], animated: true)
    }

}
