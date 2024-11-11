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
    
    @MainActor
    @ObservationIgnored
    private var phobiaUseCases = PhobiasUseCases.shared
    
    var log : [LogSession] = []
    
    @MainActor
    func getAllLog () {
        log = logUseCases.getAllLogs.execute()
    }
    
    @MainActor
    func getPhobiaById (id : Int) -> Phobia? {
        return phobiaUseCases.getPhobiaById.execute(id: id)
    }
    
}
