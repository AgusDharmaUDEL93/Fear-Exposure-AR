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
    var errorMessage : String?
    
    init() {
        getSelectedPhobia()
        print(selectedPhobia)
    }
    
    func getAllPhobia () -> [Phobia] {
        phobiaUseCases.getAllPhobia.execute()
    }
    
    func getSelectedPhobia () {
        
        let result = phobiaUseCases.getPhobiaSelected.execute()
        
        switch result {
        case .success(data: let data):
            data.forEach{ phobiaId in
                selectedPhobia.append(phobiaId)
            }
        case .error(message: let message):
            errorMessage = message
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
        
        let result = phobiaUseCases.getPhobiaSelected.execute()
        
        switch result {
        case .success(data: let data):
            
            var selectedSavedPhobia = data
            
            for phobia in selectedSavedPhobia {
                if (!selectedPhobia.contains(phobia)){
                    deletePhobia(id: phobia)
                }
            }
        
            for phobia in selectedPhobia {
                if (!selectedSavedPhobia.contains(phobia)){
                    phobiaUseCases.addPhobia.execute(id: phobia)
                }
            }
            
            selectedSavedPhobia = selectedPhobia
            
        case .error(message: let message):
            errorMessage = message
        }
    }
    
    private func deletePhobia (id : Int) {
        let result = phobiaUseCases.deletePhobia.execute(id: id)
        switch result {
        case .success(data: let data):
            print(data ?? "Data success deleted")
        case .error(message: let message):
            errorMessage = message
        }
    }
    
    func clearErrorMessage () {
        errorMessage = nil
    }
}
