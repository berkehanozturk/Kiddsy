//
//  LullabiesModule.swift
//  FairyTales
//
//  Created by Berkehan on 17.02.2022.
//

import UIKit

class LullabiesModule {
    
    static func initModule() -> UIViewController {
        guard let viewController = UIStoryboard.instantiateViewController(Storyboards.lullabies, LullabiesViewController.self) else {
            fatalError("Couldn't iniatialize LullabiesViewController from storyboard")
        }
        viewController.presenter.view = viewController
        viewController.presenter.router = viewController
        return viewController
    }
    
}
