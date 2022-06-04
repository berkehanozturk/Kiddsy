//
//  Alertable.swift
//  FairyTales
//
//  Created by Berkehan on 21.02.2022.
//

import Foundation
import UIKit
protocol Alertable {
    func showCustomAlert(title: String, message: String, actions: [UIAlertAction]?)
    
}

extension Alertable where Self: UIViewController {
    func showCustomAlert(title: String = "Oops..", message: String = "", actions: [UIAlertAction]? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if let actions = actions {
            for action in actions {
                alert.addAction(action)
            }
        }
        alert.view.layoutIfNeeded()
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil ))
        present(alert, animated: true, completion: nil)
    }
}
