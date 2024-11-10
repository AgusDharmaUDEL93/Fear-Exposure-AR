//
//  GetAssessmentStatus.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 09/11/24.
//

class GetAssessmentStatus {
    private var assessmentStatusRepository : AssessmentStatusRepository
    
    init(assessmentStatusRepository: AssessmentStatusRepository) {
        self.assessmentStatusRepository = assessmentStatusRepository
    }
    
    func execute (id : Int) -> AssessmentStatus? {
        do {
            return try assessmentStatusRepository.getAssessmentStatus(id: id)?.toAssessmentStatus()
        } catch {
            return nil
        }
    }
}
