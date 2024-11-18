//
//  DetailResultViewModel.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 11/11/24.
//

import Observation
import Foundation

@Observable
class DetailResultViewModel {
    
    @MainActor
    @ObservationIgnored
    private var logUseCases = LogUseCases.shared
    
    @MainActor
    @ObservationIgnored
    private var phobiaUseCases = PhobiasUseCases.shared
    
    var errorMessage : String?
    
    var log : LogSession = LogSession.initial
    var phobia : Phobia = Phobia.initial
    
    @MainActor
    func getLogById (id : UUID) {
        
        let result = logUseCases.getLogById.execute(id: id)
        
        switch result {
        case .success(data: let data):
            if let logData = data {
                log = logData
                let phobiaData = phobiaUseCases.getPhobiaById.execute(id: logData.phobiaId ?? 0)
                if let dataPhobia = phobiaData {
                    phobia = dataPhobia
                }
            }
        case .error(message: let message):
            errorMessage = message
        }
    }
    
    func clearErrorMessage () {
        errorMessage = nil
    }
}
