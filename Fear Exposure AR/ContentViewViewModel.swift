//
//  ContentViewViewModel.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 08/11/24.
//

import Observation

@Observable
class ContentViewViewModel {
    @MainActor
    @ObservationIgnored private var phobiaUseCases = PhobiasUseCases.shared
    
    var errorMessage : String?
    
    @MainActor
    func getPhobiaSelected () -> [Int] {
        
        let result = phobiaUseCases.getPhobiaSelected.execute()
        
        switch result {
        case .success(data: let data):
            return data
        case .error(message: let message):
            errorMessage = message
            return []
        }
        
    }
}
