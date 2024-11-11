//
//  LogUseCases.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 11/11/24.
//

@MainActor
class LogUseCases {
    let addLog : AddLog = AddLog(logRepository: LogRepositoryImpl.shared)
    
    let getAllLogs : GetAllLogs = GetAllLogs(logRepository: LogRepositoryImpl.shared)
    
    let getLogById : GetLogById = GetLogById(logRepository: LogRepositoryImpl.shared)
    
    static let shared = LogUseCases()
}
