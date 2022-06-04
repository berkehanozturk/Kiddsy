//
//  LanguageModal.swift
//  UIComponents
//
//  Created by Berkehan on 21.02.2022.
//

import Foundation
import Foundation
import UIKit
public enum LanguageKeys: String {
    case england = "en"
    case germany = "de"
    case france = "fr"
    case spain = "es"
    case turkey = "tr"
}

public struct LanguageModal  {
    public let languageKey: LanguageKeys
    public let imageName: String
    public init (languageKey: LanguageKeys, imageName: String) {
        self.languageKey = languageKey
        self.imageName = imageName
    }
}
