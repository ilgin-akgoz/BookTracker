//
//  SearchCollectionViewCell.swift
//  BookTracker
//
//  Created by Ilgın Akgöz on 5.04.2023.
//

import UIKit

/// single cell for a book
final class SearchCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "SearchCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let bookLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16,
                                 weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let authorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16,
                                 weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .clear
        contentView.addSubviews(authorLabel, bookLabel, imageView)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            bookLabel.heightAnchor.constraint(equalToConstant: 40),
            authorLabel.heightAnchor.constraint(equalToConstant: 40),
            
            bookLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            bookLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            authorLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            authorLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            
            authorLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3),
            bookLabel.bottomAnchor.constraint(equalTo: authorLabel.topAnchor, constant: -3),
            
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            imageView.bottomAnchor.constraint(equalTo: bookLabel.topAnchor, constant: -3),
        ])
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        bookLabel.text = nil
        authorLabel.text = nil
    }
    
    public func configure(with viewModel: SearchCollectionViewCellViewModel) {
        bookLabel.text = viewModel.bookTitle
        authorLabel.text = viewModel.author
        viewModel.fetchImage { [weak self] result in
          switch result {
            case .success(let data):
             DispatchQueue.main.async {
                 let image = UIImage(data: data)
                 self?.imageView.image = image
             }
            case .failure(let error):
              print(String(describing: error))
            break
          }
        }
    }
}
