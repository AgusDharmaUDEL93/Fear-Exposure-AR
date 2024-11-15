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
    
    func execute () -> Result<[LogSession]> {
        do {
            let data = (try logRepository.getAllLog()).map { $0.toLogSession() }
            return Result.success(data: data)
        } catch {
            return Result.error(message: "Data cannot be fetch")
        }
    }
}
