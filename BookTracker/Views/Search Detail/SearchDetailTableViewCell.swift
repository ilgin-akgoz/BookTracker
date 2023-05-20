//
//  SearchDetailTableViewCell.swift
//  BookTracker
//
//  Created by Ilgın Akgöz on 20.05.2023.
//

import UIKit

final class SearchDetailTableViewCell: UITableViewCell {
    static let cellIdentifier = "SearchDetailTableViewCell"
    
    private let bookImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews(titleLabel, valueLabel, bookImageView)
        setUpConstraints()
        isUserInteractionEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            bookImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            bookImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: bookImageView.bottomAnchor, constant: 10),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            valueLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            valueLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            valueLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            valueLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)

        ])
    }
    
    public func configureLabels(title: String?, value: String?) {
        titleLabel.text = title
        valueLabel.text = value
    }
    
    public func configureImage(viewModel: BookViewModel?) {
        guard let viewModel = viewModel else { return }
        
        viewModel.fetchImage { [weak self] result in
          switch result {
            case .success(let data):
             DispatchQueue.main.async {
                 let image = UIImage(data: data)
                 self?.bookImageView.image = image
             }
            case .failure(let error):
              print(String(describing: error))
            break
          }
        }
    }

}
