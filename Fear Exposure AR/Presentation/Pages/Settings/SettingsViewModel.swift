//
//  ProfileViewModel.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 06/11/24.
//

import Observation
import Foundation

@Observable
class SettingsViewModel {
    var isSheetLanguageOpen : Bool = false
    var languageSelected = Locale.current
    

//    init(){
//        if (languageSelected.identifier != Language.english.rawValue && languageSelected.identifier != Language.indonesia.rawValue){
//            languageSelected = Locale(identifier: Language.english.rawValue)
//        }
//    }
    
    func onChangedLanguage (language : Language) {
        switch (language){
        case .english:
            languageSelected = Locale(identifier: Language.english.rawValue)
            isSheetLanguageOpen = false
        case .indonesia:
            languageSelected = Locale(identifier: Language.indonesia.rawValue)
            isSheetLanguageOpen = false
        }
    }
    
    func onOpenLanguageSheets () {
        isSheetLanguageOpen = true
    }
    
    func getLanguageSeletedLabel () -> String {
        return switch (languageSelected.identifier){
        case Language.english.rawValue:
             Language.english.getLanguageLabel()
        case Language.indonesia.rawValue:
             Language.indonesia.getLanguageLabel()
        default:
             Language.english.getLanguageLabel()
        }
    }
    
    
}
