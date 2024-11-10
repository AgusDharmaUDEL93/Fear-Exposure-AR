//
//  AssessmentStatusDto.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 08/11/24.
//

import SwiftData

@Model
class AssessmentStatusDto {
    var phobiaId : Int? // Unique
    var scale : Float = 1
    var volume : Float = 0
    var isObjectFollowUser : Bool = false
    
    init(phobiaId: Int? = nil, scale: Float = 1, volume: Float = 0, isObjectFollowUser: Bool = false) {
        self.phobiaId = phobiaId
        self.scale = scale
        self.volume = volume
        self.isObjectFollowUser = isObjectFollowUser
    }
}
