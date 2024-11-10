//
//  LogDto.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 10/11/24.
//

import SwiftData
import Foundation

struct LogSessionDto {
    var logId : UUID = UUID()
    var phobiaId : Int?
    var dateTime : Date = .now
    var duration : Float = 0
    var feelingDuring : Int = -1
    var feelingAfter : Int = -1
    var notes : String = ""
    var heartRate : [Double] = []
    
}
