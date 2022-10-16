//
//  UIStackView+Extension.swift
//  HammerSystemsTest
//
//  Created by Эрмек Жоробеков on 16.10.2022.
//

import UIKit

extension UIStackView {
    
    convenience init(axis: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution, spacing: CGFloat, arrangedSubviews: [UIView]) {
        self.init()
        self.axis = axis
        self.distribution = distribution
        self.spacing = spacing
        
        for view in arrangedSubviews {
            addArrangedSubview(view)
        }
        
    }
}
