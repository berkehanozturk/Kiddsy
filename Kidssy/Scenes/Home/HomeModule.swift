//
//  HomeModule.swift
//  FairyTales
//
//  Created by Berkehan on 16.02.2022.
//

import UIKit

class HomeModule {
    
    static func initModule() -> UIViewController {
        guard let viewController = UIStoryboard.instantiateViewController(Storyboards.home, HomeViewController.self) else {
            fatalError("Couldn't iniatialize HomeViewController from storyboard")
        }
        viewController.presenter.view = viewController
        viewController.presenter.router = viewController
        return viewController
    }
    
}
