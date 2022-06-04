//
//  EducationalModule.swift
//  FairyTales
//
//  Created by Berkehan on 17.02.2022.
//

import UIKit

class EducationalModule {
    
    static func initModule() -> UIViewController {
        guard let viewController = UIStoryboard.instantiateViewController(Storyboards.educational, EducationalViewController.self) else {
            fatalError("Couldn't iniatialize EducationalViewController from storyboard")
        }
        viewController.presenter.view = viewController
        viewController.presenter.router = viewController
        return viewController
    }
    
}
