//
//  Log+Extensions.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 10/11/24.
//

import Foundation

extension LogSession {
    
    
    func toLogSessionDto () -> LogSessionDto {
        
        let feeldur : Int = switch feelingDuring {
        case .unknown:
            Feeling.unknown.rawValue
        case .terrified:
            Feeling.terrified.rawValue
        case .frightened:
            Feeling.frightened.rawValue
        case .scared:
            Feeling.scared.rawValue
        case .neutral:
            Feeling.neutral.rawValue
        }
        
        let feelAft : Int = switch feelingAfter {
            
        case .relieved:
            FeelingAfter.relieved.rawValue
        case .afraid:
            FeelingAfter.afraid.rawValue
        case .neutral:
            FeelingAfter.neutral.rawValue
        case .better:
            FeelingAfter.better.rawValue
        case .unknown:
            FeelingAfter.unknown.rawValue
        }
        
        
        return LogSessionDto(
            logId : logId ?? UUID(),
            phobiaId : phobiaId,
            phobiaName : phobiaName,
            dateTime : dateTime,
            duration : duration,
            feelingDuring : feeldur,
            feelingAfter : feelAft,
            notes : notes,
            heartRate : heartRate
           
        )
    }
}
