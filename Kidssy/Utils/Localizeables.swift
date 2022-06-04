//
//  Localizeables.swift
//  FairyTales
//
//  Created by Berkehan on 21.02.2022.
//

import Foundation
import Core
public struct Localizables {
    
    public struct Language {
        static var continueText: String { return "continue".addLocalizableString(str: Globals.selectedLanguageCode.rawValue) }
        static var backText: String { return "back".addLocalizableString(str: Globals.selectedLanguageCode.rawValue) }
        static var music: String { return "Music".addLocalizableString(str: Globals.selectedLanguageCode.rawValue) }
        static var fairyTales: String { return "Fairy Tales".addLocalizableString(str: Globals.selectedLanguageCode.rawValue) }
        static var educational: String { return "Educational".addLocalizableString(str: Globals.selectedLanguageCode.rawValue) }
        static var lullabies: String { return "Lullabies".addLocalizableString(str: Globals.selectedLanguageCode.rawValue) }


        static var letsSong: String { return "lets_song".addLocalizableString(str: Globals.selectedLanguageCode.rawValue) }
        static var sleepWell: String { return "sleep_well".addLocalizableString(str: Globals.selectedLanguageCode.rawValue) }
        static var learn: String { return "learn".addLocalizableString(str: Globals.selectedLanguageCode.rawValue) }
        static var lullabieSleep: String { return "lullabie_sleep".addLocalizableString(str: Globals.selectedLanguageCode.rawValue)}
        static var noInternet: String { return "No Internet Connection".addLocalizableString(str: Globals.selectedLanguageCode.rawValue)}

    }

}
