//
//  GetPhobiaLogDetail.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 07/11/24.
//

import Foundation

class GetLogById {
    private var logRepository : LogRepository
    
    init(logRepository: LogRepository) {
        self.logRepository = logRepository
    }
    
    func execute (id : UUID) -> LogSession? {
        do {
            return try logRepository.getLogById(id: id)?.toLogSession()
        } catch {
            return nil
        }
    }
}
