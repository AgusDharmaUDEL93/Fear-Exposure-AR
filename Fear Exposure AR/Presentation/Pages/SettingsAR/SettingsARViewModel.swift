//
//  SettingsARViewModel.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 30/10/24.
//
import Observation

@Observable
class SettingsARViewModel {
    @MainActor
    private var assessmentUseCase = AssessmentStatusUseCases.shared
    
    var errorMessage : String?
    
    var sliderValue : Float = 0
    var isObjectFollow : Bool = false
    var volume : Float = 0
    
    @MainActor
    func getAssessmentStatus(id : Int) {
        let assessment = assessmentUseCase.getAssessmentStatus.execute(id: id)
        switch assessment {
        case .success(data: let data):
            if let assessmentData = data {
                sliderValue = assessmentData.scale
                isObjectFollow = assessmentData.isObjectFollowUser
                volume = assessmentData.volume
            }
        case .error(message: let message):
            errorMessage = message
        }
        
    }
        
    @MainActor
    func updateAssessmentStatus (id : Int, isObjectFollow : Bool, volume : Float) {
        
        let assesmentData = assessmentUseCase.getAssessmentStatus.execute(id: id)
        
        switch assesmentData {
            
        case .success(data: let data):
            if let assessment = data {
                let updatedData = AssessmentStatus(
                    phobiaId: assessment.phobiaId,
                    recommendation: assessment.recommendation,
                    scale: assessment.scale,
                    volume: volume,
                    isObjectFollowUser: isObjectFollow
                    
                )
                                
                updateAssessmentStatus(updatedData: updatedData)
                
            }
        case .error(message: let message):
            errorMessage = message
        }
    }
    
    @MainActor
    private func updateAssessmentStatus (updatedData : AssessmentStatus){
        let result = assessmentUseCase.updateAssessmentStatus.execute(assessment:  updatedData)
        
        switch result  {
            
        case .success(data: let data):
            print(data)
        case .error(message: let message):
            errorMessage = message
        }
    }
    
    func clearErrorMessage () {
        errorMessage = nil
    }
}
