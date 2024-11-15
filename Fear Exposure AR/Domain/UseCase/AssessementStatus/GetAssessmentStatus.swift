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
    
    func execute (id : Int) -> Result<AssessmentStatus?> {
        do {
            let data = try assessmentStatusRepository.getAssessmentStatus(id: id)?.toAssessmentStatus()
            return Result.success(data: data)
        } catch {
            return Result.error(message: "Data assessment cannot be getted")
        }
    }
}
