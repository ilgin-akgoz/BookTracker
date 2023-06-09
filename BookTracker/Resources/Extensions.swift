//
//  Extensions.swift
//  BookTracker
//
//  Created by Ilgın Akgöz on 5.04.2023.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}

extension UIFont {
    static func newYork(size: CGFloat) -> UIFont? {
        return UIFont(name: "New York", size: size)
    }
}
