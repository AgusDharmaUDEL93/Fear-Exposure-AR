//
//  FeelingAfter.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 10/11/24.
//

enum FeelingAfter : Int {
    case relieved = 0
    case afraid = 1
    case neutral = 2
    case better = 3
    case terrified = 4
    case unknown = -1
    
    func getLabel () -> String {
        return switch self {
        case .relieved:
            String(localized: "Relieved")
        case .afraid:
            String(localized: "Afraid")
        case .neutral:
            String(localized: "Neutral")
        case .better:
            String(localized: "Better")
        case .terrified:
            String(localized: "Terrified") 
        case .unknown:
            ""
        }
    }
}
