//
//  UITableView+Extensions.swift
//  HammerSystemsTest
//
//  Created by Эрмек Жоробеков on 15.10.2022.
//

import UIKit

extension UITableViewCell: ReusableView { }

extension UITableViewHeaderFooterView: ReusableView { }


public extension UITableView {
    
    func register<T: UITableViewHeaderFooterView>(_:  T.Type) {
        register(T.self, forHeaderFooterViewReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func register<T: UITableViewCell>(_ : T.Type) {
        register(T.self, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue table cell with identifier: \(T.defaultReuseIdentifier)")
        }
        return cell
    }
    
}
