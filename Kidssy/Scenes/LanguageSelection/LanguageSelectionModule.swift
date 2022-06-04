//
//  LanguageSelectionModule.swift
//  FairyTales
//
//  Created by Berkehan on 21.02.2022.
//

import UIKit

class LanguageSelectionModule {
    
    static func initModule() -> UIViewController {
        guard let viewController = UIStoryboard.instantiateViewController(Storyboards.languageSelection, LanguageSelectionViewController.self) else {
            fatalError("Couldn't iniatialize LanguageSelectionViewController from storyboard")
        }
        viewController.presenter.view = viewController
        viewController.presenter.router = viewController
        return viewController
    }
    
}
