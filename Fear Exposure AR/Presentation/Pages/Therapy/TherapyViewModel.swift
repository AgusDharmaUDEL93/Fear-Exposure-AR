//
//  TherapyViewModel.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 07/11/24.
//

import Observation

@Observable
class TherapyViewModel {
    private var phobiaUseCases = PhobiasUseCases.shared
    
    var phobia : [Phobia] = []
    
    @MainActor
    init () {
        getSelectedPhobia()
    }

    @MainActor
    func getSelectedPhobia () {
        let selectedIdPhobia = phobiaUseCases.getPhobiaSelected.execute()
        print(selectedIdPhobia)
        phobia = phobiaUseCases.getAllPhobia.execute(listId: selectedIdPhobia)
    }
}
