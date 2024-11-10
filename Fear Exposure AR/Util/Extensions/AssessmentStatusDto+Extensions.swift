//
//  AssessmentDto+Extensions.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 08/11/24.
//

extension AssessmentStatusDto {
    func toAssessmentStatus () -> AssessmentStatus {
        return AssessmentStatus(
            phobiaId: phobiaId,
            scale: scale,
            volume: volume,
            isObjectFollowUser: isObjectFollowUser
        )
    }
}
