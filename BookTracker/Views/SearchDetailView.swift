//
//  SearchDetailView.swift
//  BookTracker
//
//  Created by Ilgın Akgöz on 20.04.2023.
//

import UIKit

final class SearchDetailView: UIView {
    private let authorLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let bookLabel: UILabel = {
        let title = UILabel()
        title.textAlignment = .center
        title.font = .systemFont(ofSize: 16, weight: .medium)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let publisherLabel: UILabel = {
        let title = UILabel()
        title.textAlignment = .center
        title.font = .systemFont(ofSize: 16, weight: .medium)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let pageCountLabel: UILabel = {
        let title = UILabel()
        title.textAlignment = .center
        title.font = .systemFont(ofSize: 16, weight: .medium)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews(authorLabel, bookLabel, publisherLabel, pageCountLabel)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            bookLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            bookLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -20),
            bookLabel.heightAnchor.constraint(equalToConstant: 40),
            bookLabel.widthAnchor.constraint(equalTo: widthAnchor, constant: -40),
            
            authorLabel.topAnchor.constraint(equalTo: bookLabel.bottomAnchor, constant: 20),
            authorLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            authorLabel.heightAnchor.constraint(equalToConstant: 40),
            authorLabel.widthAnchor.constraint(equalTo: widthAnchor, constant: -40),
            
            publisherLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 20),
            publisherLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            publisherLabel.heightAnchor.constraint(equalToConstant: 40),
            publisherLabel.widthAnchor.constraint(equalTo: widthAnchor, constant: -40),
            
            pageCountLabel.topAnchor.constraint(equalTo: publisherLabel.bottomAnchor, constant: 20),
            pageCountLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            pageCountLabel.heightAnchor.constraint(equalToConstant: 40),
            pageCountLabel.widthAnchor.constraint(equalTo: widthAnchor, constant: -40),
            pageCountLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -20),
        ])
    }
    
    public func config(with viewModel: SearchDetailViewViewModel) {
        bookLabel.text = "Title: \(viewModel.bookTitle)"
        authorLabel.text = "Author: \(viewModel.author)"
        publisherLabel.text = "Publisher: \(viewModel.publisher)"
        pageCountLabel.text = "Page Count: \(viewModel.pageCount)"
    }

}
