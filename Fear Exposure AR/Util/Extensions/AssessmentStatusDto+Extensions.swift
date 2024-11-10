//
//  AssessmentDto+Extensions.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 08/11/24.
//

extension AssessmentStatusDto {
    func toAssessmentStatus () -> AssessmentStatus {
        var recommendationState : Recommendation = .picture
        
        switch recommendation {
        case Recommendation.picture.rawValue :
            recommendationState = .picture
        case Recommendation.arStatic.rawValue :
            recommendationState = .arStatic
        case Recommendation.arDinamic.rawValue :
            recommendationState = .arDinamic
        default:
            recommendationState = .picture
        }
        return AssessmentStatus(
            phobiaId: phobiaId,
            recommendation: recommendationState,
            scale: scale,
            volume: volume,
            isObjectFollowUser: isObjectFollowUser
        )
    }
}
