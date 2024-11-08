//
//  IntroductionPhobiaViewModel.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 07/11/24.
//

import Observation

@MainActor
@Observable
class IntroductionPhobiaViewModel {
    @ObservationIgnored private let phobiaUseCases = PhobiasUseCases.shared
    
    var selectedPhobia : [Int] = []
    
    init() {
        getSelectedPhobia()
        print(selectedPhobia)
    }
    
    func getAllPhobia () -> [Phobia] {
        phobiaUseCases.getAllPhobia.execute()
    }
    
    func getSelectedPhobia () {
        phobiaUseCases.getPhobiaSelected.execute().forEach{ phobiaId in
            selectedPhobia.append(phobiaId)
        }
    }
    
    func onTapSelection (id : Int) {
        if (selectedPhobia.contains(id)){
            if let index = selectedPhobia.firstIndex(of: id) {
                selectedPhobia.remove(at:  index)
            }
            return
        }
        selectedPhobia.append(id)
    }
    
    func onSubmitPhobia () {
        var selectedSavedPhobia = phobiaUseCases.getPhobiaSelected.execute()
        
        for phobia in selectedSavedPhobia {
            if (!selectedPhobia.contains(phobia)){
                phobiaUseCases.deletePhobia.execute(id: phobia)
            }
        }
    
        for phobia in selectedPhobia {
            if (!selectedSavedPhobia.contains(phobia)){
                phobiaUseCases.addPhobia.execute(id: phobia)
            }
        }
        
        selectedSavedPhobia = selectedPhobia
    }
    
}
