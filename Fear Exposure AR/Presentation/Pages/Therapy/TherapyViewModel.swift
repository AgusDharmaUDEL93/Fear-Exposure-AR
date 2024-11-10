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
    
    var phobia : [Phobia] = .init()
    
    init () {
        getSelectedPhobia()
    }

    func getSelectedPhobia () {
        let selectedIdPhobia = phobiaUseCases.getPhobiaSelected.execute()
        phobia = phobiaUseCases.getAllPhobia.execute(listId: selectedIdPhobia)
    }
    
    func getAssessmentStatus (phobiaId : Int) -> AssessmentStatus? {
        return assessmentStatusUseCases.getAssessmentStatus.execute(id: phobiaId)
    }
    
}
