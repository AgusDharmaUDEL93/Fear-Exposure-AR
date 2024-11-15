//
//  RecommendationViewModel.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 10/11/24.
//

import Observation

@Observable
class  RecommendationViewModel {
    @MainActor
    @ObservationIgnored
    private let assessmentStatusUseCases = AssessmentStatusUseCases.shared
    
    var errorMessage : String?
    
    var isPictureRecomended : Bool = false
    var isARRecomended : Bool = false
    
    var isPictureSelected : Bool = false
    var isARSelected : Bool = false
    
    var assessmentResult : AssessmentStatus?
    
    @MainActor
    func getAssessmentData (id : Int) {
        
        let result = assessmentStatusUseCases.getAssessmentStatus.execute(id: id)
        
        switch result {
            
        case .success(data: let data):
            assessmentResult = data
            
            if let resultData = assessmentResult {
                switch resultData.recommendation {
                case .picture:
                    isPictureRecomended = true
                case .arStatic:
                    isARRecomended = true
                case .arDinamic:
                    isARRecomended = true
                }
            }
        case .error(message: let message):
            errorMessage = message
        }
                
    }
    
    func onSelectedPicture () {
        isPictureSelected = true
        isARSelected = false
    }
    
    func onSelectedAR () {
        isARSelected = true
        isPictureSelected = false
    }
    
    func clearErrorMessage () {
        errorMessage = nil
    }
}
