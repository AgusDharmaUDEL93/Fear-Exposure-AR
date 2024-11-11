//
//  LogDto.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 10/11/24.
//

import SwiftData
import Foundation

@Model
class LogSessionDto {
    var logId : UUID = UUID()
    var phobiaId : Int?
    var phobiaName : String?
    var dateTime : Date = Date.now
    var duration : Double = 0
    var feelingDuring : Int = -1
    var feelingAfter : Int = -1
    var notes : String = ""
    var heartRate : [Double] = []
    
    init(logId: UUID = UUID(), phobiaId: Int? = nil, phobiaName : String? = nil, dateTime: Date = .now, duration: Double = 0, feelingDuring: Int = -1, feelingAfter: Int = -1, notes: String = "", heartRate: [Double] = []) {
        self.logId = logId
        self.phobiaId = phobiaId
        self.phobiaName = phobiaName
        self.dateTime = dateTime
        self.duration = duration
        self.feelingDuring = feelingDuring
        self.feelingAfter = feelingAfter
        self.notes = notes
        self.heartRate = heartRate
    }
}
