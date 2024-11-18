//
//  Language.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 06/11/24.
//

enum Language : String {
    case english = "en"
    case indonesia = "id_ID"
    
    func getLanguageLabel () -> String {
        return switch self {
        case .english:
            "English (US)"
        case .indonesia:
            "Indonesia"
        }
    }
}
