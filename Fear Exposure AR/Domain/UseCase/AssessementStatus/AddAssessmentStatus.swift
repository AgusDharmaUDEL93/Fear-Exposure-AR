//
//  Untitled.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 09/11/24.
//


class AddAssessmentStatus {
    private var assessmentStatusRepository : AssessmentStatusRepository
    
    init(assessmentStatusRepository: AssessmentStatusRepository) {
        self.assessmentStatusRepository = assessmentStatusRepository
    }
    
    func execute (assessment : AssessmentStatus) {
        assessmentStatusRepository.addAssessmentStatus(assessment: assessment.toAssessmentStatusDto())
    }
}
