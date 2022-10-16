//
//  UILabel + Extension.swift
//  HammerSystemsTest
//
//  Created by Эрмек Жоробеков on 15.10.2022.
//

import UIKit

extension UILabel {
    
    convenience init(text: String = "", font: UIFont? = UIFont.boldSystemFont(ofSize: 17), numberOfLines: Int = 1, alignment: NSTextAlignment = .left ) {
        self.init()
        
        self.text = text
        self.font = font
        self.numberOfLines = numberOfLines
        self.textAlignment = alignment
    }
}
