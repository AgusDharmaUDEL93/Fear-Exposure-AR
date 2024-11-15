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
    
    func execute (id : UUID) -> Result<LogSession?> {
        do {
            let data = try logRepository.getLogById(id: id)?.toLogSession()
            return Result.success(data: data)
        } catch {
            return Result.error(message: "Cannot get data by id")
        }
    }
}
