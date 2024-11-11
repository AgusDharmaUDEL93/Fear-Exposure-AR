//
//  LogDto+Extensions.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 10/11/24.
//

extension LogSessionDto {
    func toLogSession () -> LogSession {
        
        var feelDur : Feeling = .unknown
        var feelAft : FeelingAfter = .unknown
        
        switch feelingDuring {
        case Feeling.terrified.rawValue:
            feelDur = Feeling.terrified
        case Feeling.frightened.rawValue:
            feelDur = Feeling.frightened
        case Feeling.scared.rawValue :
            feelDur = Feeling.scared
        case Feeling.neutral.rawValue :
            feelDur = Feeling.neutral
        default:
            feelDur = Feeling.unknown
        }
        
        switch feelingAfter {
        case FeelingAfter.relieved.rawValue:
            feelAft = FeelingAfter.relieved
        case FeelingAfter.afraid.rawValue:
            feelAft = FeelingAfter.afraid
        case FeelingAfter.better.rawValue :
            feelAft = FeelingAfter.better
        case FeelingAfter.neutral.rawValue :
            feelAft = FeelingAfter.neutral
        default:
            feelAft = FeelingAfter.unknown
        }
    
        
        return LogSession(
            logId: logId,
            phobiaId: phobiaId,
            phobiaName: phobiaName,
            dateTime: dateTime,
            duration: duration,
            feelingDuring: feelDur,
            feelingAfter: feelAft,
            notes: notes,
            heartRate: heartRate
        )
    }
}
