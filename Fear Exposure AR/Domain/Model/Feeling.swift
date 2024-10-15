//
//  Feeling.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 15/10/24.
//

enum Feeling : Int {
    case veryHappy = 4
    case happy = 3
    case neutral = 2
    case notHappy = 1
    case crying = 0
    
    func getEmoji () -> String {
        return switch self {
            
        case .veryHappy:
            "😊"
        case .happy:
            "🙂"
        case .neutral:
            "😐"
        case .notHappy:
            "☹️"
        case .crying:
            "😭"
        }
    }
}
