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
        print("Use Case : \(log.phobiaName)")
        let data =  log.toLogSessionDto()
        print("Data Use Case : \(data.phobiaName)")
        logRepository.addLog(log: data)
    }
}
