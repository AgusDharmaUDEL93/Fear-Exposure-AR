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
    
    var sliderValue : Float = 0
    var isObjectFollow : Bool = false
    var volume : Float = 0
    
    @MainActor
    func getAssessmentStatus(id : Int) {
        let assessment = assessmentUseCase.getAssessmentStatus.execute(id: id)
        if let assessmentData = assessment {
            sliderValue = assessmentData.scale
            isObjectFollow = assessmentData.isObjectFollowUser
            volume = assessmentData.volume
        }
    }
        
    @MainActor
    func updateAssessmentStatus (id : Int, isObjectFollow : Bool, volume : Float) {
        
        let assesmentData = assessmentUseCase.getAssessmentStatus.execute(id: id)
        
        if let assessment = assesmentData {
            let updatedData = AssessmentStatus(
                phobiaId: assessment.phobiaId,
                recommendation: assessment.recommendation,
                scale: assessment.scale,
                volume: volume,
                isObjectFollowUser: isObjectFollow
                
            )
            
            print("On Updata Settings : \(updatedData.isObjectFollowUser)")
            assessmentUseCase.updateAssessmentStatus.execute(assessment:  updatedData)
            
        }
        
       
        
        
        
    }
}
