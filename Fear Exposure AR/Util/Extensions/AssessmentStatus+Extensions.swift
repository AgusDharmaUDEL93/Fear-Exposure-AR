//
//  Assessment+Extensions.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 08/11/24.
//

extension AssessmentStatus {
    func toAssessmentStatusDto () -> AssessmentStatusDto {
        return AssessmentStatusDto(
            phobiaId: phobiaId,
            isDoneScreening: isDoneScreening,
            scale: scale,
            volume: volume,
            isObjectFollowUser: isObjectFollowUser
        )
    }
}
