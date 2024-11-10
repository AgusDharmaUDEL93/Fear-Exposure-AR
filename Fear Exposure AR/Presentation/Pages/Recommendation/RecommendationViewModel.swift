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
    
    var isPictureRecomended : Bool = false
    var isARRecomended : Bool = false
    
    var isPictureSelected : Bool = false
    var isARSelected : Bool = false
    
    var assessmentResult : AssessmentStatus?
    
    @MainActor
    func getAssessmentData (id : Int) {
        assessmentResult = assessmentStatusUseCases.getAssessmentStatus.execute(id: id)
        if let result = assessmentResult {
            switch result.recommendation {
            case .picture:
                isPictureRecomended = true
            case .arStatic:
                isARRecomended = true
            case .arDinamic:
                isARRecomended = true
            }
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
}
