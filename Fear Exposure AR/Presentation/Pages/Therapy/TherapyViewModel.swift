//
//  TherapyViewModel.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 07/11/24.
//

import Observation

@MainActor
@Observable
class TherapyViewModel {
    @ObservationIgnored private var phobiaUseCases = PhobiasUseCases.shared
    
    @ObservationIgnored private var assessmentStatusUseCases = AssessmentStatusUseCases.shared
    
    var errorMessage : String?
    
    var phobia : [Phobia] = .init()
    
    init () {
        getSelectedPhobia()
    }

    func getSelectedPhobia () {
        
        let result = phobiaUseCases.getPhobiaSelected.execute()
        
        switch result {
        case .success(data: let data):
            phobia = phobiaUseCases.getAllPhobia.execute(listId: data)
        case .error(message: let message):
            errorMessage = message
        }
        
    }
    
    func getAssessmentStatus (phobiaId : Int) -> AssessmentStatus? {
        let result = assessmentStatusUseCases.getAssessmentStatus.execute(id: phobiaId)
        
        switch result {
            
        case .success(data: let data):
            return data
        case .error(message: let message):
            errorMessage = message
            return nil
        }
    }
    
    func clearErrorMessage () {
        errorMessage = nil
    }
    
}
