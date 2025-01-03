//
//  Feeling.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 15/10/24.
//

enum Feeling : Int {
    case unknown = -1
    case terrified = 0
    case frightened = 1
    case scared = 2
    case neutral = 3
    
    func getEmoji () -> String {
        return switch self {
        case .unknown:
            ""
        case .terrified:
            "😰"
        case .frightened:
            "😨"
        case .scared:
            "😧"
        case .neutral:
            "😐"
            
        }
        
        
    }
    func getLabel () -> String {
        return switch self {
        case .unknown:
            ""
        case .terrified:
            "Terrified"
        case .frightened:
            "Frightened"
        case .scared:
            "Scared"
        case .neutral:
             "Neutral"
            
        }
    }
}
