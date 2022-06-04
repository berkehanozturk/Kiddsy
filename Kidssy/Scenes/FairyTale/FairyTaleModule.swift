//
//  FairyTaleModule.swift
//  FairyTales
//
//  Created by Berkehan on 17.02.2022.
//

import UIKit

class FairyTaleModule {
    
    static func initModule() -> UIViewController {
        guard let viewController = UIStoryboard.instantiateViewController(Storyboards.fairyTale, FairyTaleViewController.self) else {
            fatalError("Couldn't iniatialize FairyTaleViewController from storyboard")
        }
        viewController.presenter.view = viewController
        viewController.presenter.router = viewController
        return viewController
    }
    
}
