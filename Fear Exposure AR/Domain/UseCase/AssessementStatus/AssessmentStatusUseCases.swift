//
//  AssessmentStatusUseCases.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 09/11/24.
//

@MainActor
class AssessmentStatusUseCases {
    let getAssessmentStatus = GetAssessmentStatus(assessmentStatusRepository: AssessmentStatusRepositoryImpl.shared)
    let updateAssessmentStatus = UpdateAssessmentStatus(assessmentStatusRepository: AssessmentStatusRepositoryImpl.shared)
    let addAssessmentStatus = AddAssessmentStatus(assessmentStatusRepository: AssessmentStatusRepositoryImpl.shared)
    
    static let shared = AssessmentStatusUseCases()

}
