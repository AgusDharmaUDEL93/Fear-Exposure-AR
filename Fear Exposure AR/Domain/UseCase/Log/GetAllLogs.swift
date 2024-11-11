//
//  GetPhobiaLogs.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 07/11/24.
//

class GetAllLogs {
    private var logRepository : LogRepository
    
    init(logRepository: LogRepository) {
        self.logRepository = logRepository
    }
    
    func execute () -> [LogSession]{
        do {
            return (try logRepository.getAllLog()).map { $0.toLogSession() }
        } catch {
            return []
        }
    }
}