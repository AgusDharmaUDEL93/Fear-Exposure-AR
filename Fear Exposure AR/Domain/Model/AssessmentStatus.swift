//
//  AssessmentStatus.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 08/11/24.
//

struct AssessmentStatus {
    var phobiaId : Int? // Unique
    var recommendation : Recommendation = .picture
    var scale : Float = 0
    var volume : Float = 0.5
    var isObjectFollowUser : Bool = false
}
