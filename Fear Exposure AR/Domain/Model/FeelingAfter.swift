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
    case unknown = -1
    
    func getLabel () -> String {
        return switch self {
        case .relieved:
            "Relieved"
        case .afraid:
            "Afraid"
        case .neutral:
            "Neutral"
        case .better:
            "Better"
        case .unknown:
            ""
        }
    }
}
