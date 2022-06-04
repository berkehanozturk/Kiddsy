//
//  BaseViewController.swift
//  FairyTales
//
//  Created by Berkehan on 19.02.2022.
//

import Foundation
import UIKit
import UIComponents
protocol BaseRouter: AnyObject {
  
}

protocol BaseView: AnyObject, Loadable, Alertable {
    func showLoader()
    func hideLoader()
    func showAlert(title: String, message: String, actions: [UIAlertAction]?)

}

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        self.navigationItem.backButtonTitle = ""
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
//        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:Localizables.Language.backText.addLocalizableString(str: Globals.selectedLanguageCode.rawValue), style:.plain, target:nil, action:nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
     
    }
      
    
}

extension BaseView  {
    func showLoader() {
        startLoading()
    }
    
    func hideLoader() {
        stopLoading()
    }
    
    func showAlert(title: String, message: String, actions: [UIAlertAction]?) {
        self.showCustomAlert(title: title, message: message, actions: actions)
    }

}
