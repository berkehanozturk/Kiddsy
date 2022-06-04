//
//  PlayModule.swift
//  FairyTales
//
//  Created by Berkehan on 18.02.2022.
//

import UIKit

class PlayModule {
    
    static func initModule() -> UIViewController {
        guard let viewController = UIStoryboard.instantiateViewController(Storyboards.play, PlayViewController.self) else {
            fatalError("Couldn't iniatialize PlayViewController from storyboard")
        }
        viewController.presenter.view = viewController
        viewController.presenter.router = viewController
        return viewController
    }
    
}
