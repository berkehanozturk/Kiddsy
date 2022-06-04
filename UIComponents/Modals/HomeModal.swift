//
//  HomeModal.swift
//  UIComponents
//
//  Created by Berkehan on 16.02.2022.
//

import Foundation
import UIKit
import Core
public enum CardTitles: String {
    case educational = "Educational"
    case music = "Music"
    case lullabies = "Lullabies"
    case fairyTales = "Fairy Tales"
}

public struct HomeModal  {
    public let title: CardTitles
    public let imageName: String
    public let color: UIColor
    public init (title: CardTitles, imageName: String, color: UIColor) {
        self.title = title
        self.imageName = imageName
        self.color = color
    }
}
