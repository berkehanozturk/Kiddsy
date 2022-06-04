//
//  TableView.swift
//  UIComponents
//
//  Created by Berkehan on 16.02.2022.
//

import Foundation
import UIKit

public protocol ReusableView: AnyObject {
    static var defaultReuseIdentifier: String { get }
}
public extension ReusableView where Self: UIView {
     static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}
public protocol NibLoadableView: AnyObject {
    static var nibName: String { get }
}

public extension NibLoadableView where Self: UIView {
     static var nibName: String {
        return String(describing: self)
    }
}

public extension UITableView {
    func register<T: UITableViewCell>(_: T.Type) where T: ReusableView {

        register(T.self, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }

    func register<T: UITableViewCell>(_: T.Type) where T: ReusableView, T: NibLoadableView {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        register(nib, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }

    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
        }

        return cell
    }
}
