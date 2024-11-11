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
    var phobiaName : String?
    var dateTime : Date = .now
    var duration : Double = 0
    var feelingDuring : Feeling = .unknown
    var feelingAfter : FeelingAfter = .unknown
    var notes : String
    var heartRate : [Double]
    
}
