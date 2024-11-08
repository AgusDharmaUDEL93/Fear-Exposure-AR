//
//  AssessmentStatusRepository.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 08/11/24.
//

protocol AssessmentStatusRepository {
    func getAssessmentStatus (id : Int) throws -> AssessmentStatusDto?
    
    func updateAssessmentStatus (assessment : AssessmentStatus) throws
}
