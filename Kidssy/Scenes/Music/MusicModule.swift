//
//  MusicModule.swift
//  FairyTales
//
//  Created by Berkehan on 17.02.2022.
//

import UIKit

class MusicModule {
    
    static func initModule() -> UIViewController {
        guard let viewController = UIStoryboard.instantiateViewController(Storyboards.music, MusicViewController.self) else {
            fatalError("Couldn't iniatialize MusicViewController from storyboard")
        }
        viewController.presenter.view = viewController
        viewController.presenter.router = viewController
        return viewController
    }
    
}
