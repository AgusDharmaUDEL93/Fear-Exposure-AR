//
//  AddLog.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 07/11/24.
//

class AddLog {
    private var logRepository : LogRepository
    
    init(logRepository: LogRepository) {
        self.logRepository = logRepository
    }
    
    func execute (log : LogSession){
        let data =  log.toLogSessionDto()
        logRepository.addLog(log: data)
    }
}
