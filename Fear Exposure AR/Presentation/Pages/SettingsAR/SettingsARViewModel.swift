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
    
    @MainActor
    func getAssessmentStatus(id : Int) {
        let assessment = assessmentUseCase.getAssessmentStatus.execute(id: id)
        if let assessmentData = assessment {
            sliderValue = assessmentData.scale
            isObjectFollow = assessmentData.isObjectFollowUser
        }
    }
    
    func setSettingValue (sliderValue : Float, isObjectFollow : Bool) {
        self.sliderValue = sliderValue
        self.isObjectFollow = isObjectFollow
    }
    
    @MainActor
    func updateAssessmentStatus (id : Int, isObjectFollow : Bool) {
        
        let assesmentData = assessmentUseCase.getAssessmentStatus.execute(id: id)
        
        if let assessment = assesmentData {
            let updatedData = AssessmentStatus(
                phobiaId: assessment.phobiaId,
                recommendation: assessment.recommendation,
                scale: assessment.scale,
                volume: assessment.volume,
                isObjectFollowUser: isObjectFollow
                
            )
            assessmentUseCase.updateAssessmentStatus.execute(assessment:  updatedData)
            
        }
        
       
        
        
        
    }
}
