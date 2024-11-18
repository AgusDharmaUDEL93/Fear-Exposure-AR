//
//  Log.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 07/11/24.
//

import Foundation

struct LogSession {
    var logId : UUID?
    var phobiaId : Int?
    var dateTime : Date = .now
    var duration : Double = 0
    var feelingDuring : Feeling = .unknown
    var feelingAfter : FeelingAfter = .unknown
    var notes : String
    var heartRate : [Double]
    
    static let initial = LogSession(
        dateTime: Date.now , duration: 120, feelingDuring: .frightened, notes: "Today’s session went better than I expected. I managed to look at photos of small spiders without that usual rush of panic.", heartRate: [90, 80, 94, 97, 93]
    )
}
