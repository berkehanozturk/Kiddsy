//
//  PlayPresenter.swift
//  FairyTales
//
//  Created by Berkehan on 18.02.2022.
//

import Foundation
import Core
class PlayPresenter {
    
    weak var view: PlayView?
    weak var router: PlayRouter?
    func getPlayerConfigs() -> [String: Any] {
        return [
            "controls" : "1",
            "showinfo" : "0",
            "autoplay": "1",
            "modestbranding": "0",
            "iv_load_policy" : "3",
            "fs": "0",
            "playsinline" : "1"
        ]
    }
    
    func getSelectedVideoId() -> String? {
        if let videoUrlString =  Globals.selectedItem?.videoUrl {
            let matched = videoUrlString.matches(for: "\\?v.*", in: videoUrlString)
            if let str = matched.first {
                let mySubstring = str.substring(with: 3..<14)
                return mySubstring
            }
        }
        
        return nil
    }
    
}
