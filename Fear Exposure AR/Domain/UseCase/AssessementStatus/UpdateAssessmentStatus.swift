//
//  UpdateAssessmentStatus.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 09/11/24.
//

class UpdateAssessmentStatus {
    private var assessmentStatusRepository : AssessmentStatusRepository
    
    init(assessmentStatusRepository: AssessmentStatusRepository) {
        self.assessmentStatusRepository = assessmentStatusRepository
    }
    
    func execute (assessment : AssessmentStatus) -> Result<String> {
        do {
            try assessmentStatusRepository.updateAssessmentStatus(assessment: assessment.toAssessmentStatusDto())
            return Result.success(data: "Success to update data assessment")
        } catch {
            return Result.error(message: "Cannot update data assessment")
        }
    }
}
