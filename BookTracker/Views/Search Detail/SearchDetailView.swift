//
//  SearchDetailView.swift
//  BookTracker
//
//  Created by Ilgın Akgöz on 20.04.2023.
//

import UIKit

final class SearchDetailView: UITableView {
    private var bookViewModel: BookViewModel?
    
    init() {
        super.init(frame: .zero, style: .plain)
        register(SearchDetailTableViewCell.self, forCellReuseIdentifier: SearchDetailTableViewCell.cellIdentifier)
        dataSource = self
        delegate = self
        separatorStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    public func config(with viewModel: BookViewModel) {
        bookViewModel = viewModel
        reloadData()
    }
}

extension SearchDetailView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchDetailTableViewCell") as? SearchDetailTableViewCell else {
            fatalError("Unsupported cell")
        }
        
        switch indexPath.row {
        case 0:
            cell.configureImage(viewModel: bookViewModel)
        case 1:
            cell.configureLabels(title: "Title", value: bookViewModel?.bookTitle)
        case 2:
            cell.configureLabels(title: "Author", value: bookViewModel?.author)
        case 3:
            cell.configureLabels(title: "Publisher", value: bookViewModel?.publisher)
        case 4:
            cell.configureLabels(title: "Page Count", value: "\(bookViewModel?.pageCount ?? 0)")
        default:
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 200
        } else {
            return UITableView.automaticDimension
        }
    }
}
    
    

