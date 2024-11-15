//
//  LogsViewModel.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 11/11/24.
//

import Observation

@Observable
class LogsViewModel {
    
    @MainActor
    @ObservationIgnored
    private var logUseCases = LogUseCases.shared
    
    var errorMessage : String?
    
    @MainActor
    @ObservationIgnored
    private var phobiaUseCases = PhobiasUseCases.shared
    
    var log : [LogSession] = []
    
    @MainActor
    func getAllLog () {
        let result = logUseCases.getAllLogs.execute()
        
        switch result {
        case .success(data: let data):
            log = data
        case .error(message: let message):
            errorMessage = message
        }
    }
    
    @MainActor
    func getPhobiaById (id : Int) -> Phobia? {
        return phobiaUseCases.getPhobiaById.execute(id: id)
    }
    
    func clearErrorMessage () {
        errorMessage = nil
    }
    
}
