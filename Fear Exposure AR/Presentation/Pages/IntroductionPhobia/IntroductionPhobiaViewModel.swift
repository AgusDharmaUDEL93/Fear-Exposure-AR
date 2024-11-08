//
//  IntroductionPhobiaViewModel.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 07/11/24.
//

import Observation

@Observable
class IntroductionPhobiaViewModel {
    private let phobiaUseCases = PhobiasUseCases.shared
    
    var selectedPhobia : [Int] = []
    
    @MainActor
    init() {
        getSelectedPhobia()
    }
    
    @MainActor
    func getAllPhobia () -> [Phobia] {
        phobiaUseCases.getAllPhobia.execute()
    }
    
    @MainActor
    func getSelectedPhobia () {
        phobiaUseCases.getPhobiaSelected.execute().forEach{ phobiaId in
            selectedPhobia.append(phobiaId)
        }
    }
    
    @MainActor
    func onTapSelection (id : Int) {
        if (selectedPhobia.contains(id)){
            if let index = selectedPhobia.firstIndex(of: id) {
                selectedPhobia.remove(at:  index)
            }
            phobiaUseCases.deletePhobia.execute(id: id)
            return
        }
        selectedPhobia.append(id)
        phobiaUseCases.addPhobia.execute(id: id)
    }
    
}
