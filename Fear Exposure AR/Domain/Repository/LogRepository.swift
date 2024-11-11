//
//  LogRepository.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 10/11/24.
//

import Foundation

protocol LogRepository {
    func addLog (log : LogSessionDto)
    
    func getLogById(id : UUID) throws -> LogSessionDto?
    
    func getAllLog() throws -> [LogSessionDto]
}
