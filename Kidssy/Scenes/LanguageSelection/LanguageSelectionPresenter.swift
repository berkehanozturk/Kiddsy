//
//  LanguageSelectionPresenter.swift
//  FairyTales
//
//  Created by Berkehan on 21.02.2022.
//

import Foundation
import UIComponents
import UIKit
class LanguageSelectionPresenter {
    
    weak var view: LanguageSelectionView?
    weak var router: LanguageSelectionRouter?
    var index = 0
    var languageArray = [LanguageModal(languageKey: LanguageKeys.england, imageName: ImageNames.england),
                         LanguageModal(languageKey: LanguageKeys.germany, imageName: ImageNames.germany),
                         LanguageModal(languageKey: LanguageKeys.france, imageName: ImageNames.france),
                         LanguageModal(languageKey: LanguageKeys.spain, imageName: ImageNames.spain),
                         LanguageModal(languageKey: LanguageKeys.turkey, imageName: ImageNames.turkey),
    ]
    
    func getLanguageArray() -> [LanguageModal] {
        return languageArray
        
    }
    
    private func incrementIndex(by: Int) {
        index = index+by
    }
    
    private func decrementIndex(by: Int) {
        index = index-by
    }
    private func getIndex()-> Int {
        if index < 0 {
            index = languageArray.count-1
        }
        else if index > languageArray.count-1 {
            index = 0
        }
        return index
    }
    func forwardButtonClicked() {
        incrementIndex(by: 1)
        let index = getIndex()
        if let image = UIImage(named: languageArray[index].imageName) {
            Globals.selectedLanguageCode = languageArray[index].languageKey
            view?.updateFlagForward(with: image)
        }

    }
    
    func backwardButtonClicked() {
        decrementIndex(by: 1)
        let index = getIndex()
        if let image = UIImage(named: languageArray[index].imageName) {
            Globals.selectedLanguageCode = languageArray[index].languageKey
            view?.updateFlagBackward(with: image)
        }
        

    }
    
    func continueButtonClicked() {
        let index = getIndex()
        Globals.selectedLanguageCode = languageArray[index].languageKey
        router?.goToHomeScreen()
    }
    
    

}
