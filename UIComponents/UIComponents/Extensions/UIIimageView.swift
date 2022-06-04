//
//  UIIimageView.swift
//  UIComponents
//
//  Created by Berkehan on 17.02.2022.
//

import Foundation
import Kingfisher
import UIKit
public extension UIImageView {
    
    func setImage(with url: URL?) {
        self.kf.setImage(with: url, placeholder: nil)
    }
    func setImage(with string: String?) {
        if let string = string {
            if let url = URL(string: string) {
                setImage(with: url)
            
            }
        }
    }
    
    func asCircle() {
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.masksToBounds = true
    }
    
    func downloadImage(url: URL){
        let resource = ImageResource(downloadURL: url)

        KingfisherManager.shared.retrieveImage(with: resource, options: nil, progressBlock: nil) { result in
            switch result {
            case .success(let value):
                print("Image: \(value.image). Got from: \(value.cacheType)")
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}
