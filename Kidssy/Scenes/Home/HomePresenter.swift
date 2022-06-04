//
//  HomePresenter.swift
//  FairyTales
//
//  Created by Berkehan on 16.02.2022.
//

import Foundation
import UIComponents
import UIKit
class HomePresenter {
    
    weak var view: HomeView?
    weak var router: HomeRouter?
    var homeModalArray = [HomeModal(title: CardTitles.music, imageName: ImageNames.music, color: UIColor.bottomOrange),
                          HomeModal(title: CardTitles.fairyTales, imageName: ImageNames.tale, color: UIColor.topPink),
                          HomeModal(title: CardTitles.lullabies, imageName: ImageNames.lullaby, color: UIColor.bottomPink),
                          HomeModal(title: CardTitles.educational, imageName: ImageNames.education, color: UIColor.middleGreen)]
    
    func getHomeDataArray() -> [HomeModal] {
        return homeModalArray
    }
    
    func getHomeDataArrayCount() -> Int {
        return homeModalArray.count
    }
    
    func getHomeItemAtIndexPath(indexPath: IndexPath) -> HomeModal {
        return homeModalArray[indexPath.row]
    }
    
    func chooseScreen(indexPath: IndexPath) {
        switch homeModalArray[indexPath.row].title {
        case CardTitles.music:
            router?.gotoMusicScreen()
            
        case CardTitles.lullabies:
            router?.gotoLullabiesScreen()
            
        case CardTitles.educational:
            router?.gotoEducationalScreen()
            
        case CardTitles.fairyTales:
            router?.gotoFairyTaleScreen()
        }
    }
    

}
