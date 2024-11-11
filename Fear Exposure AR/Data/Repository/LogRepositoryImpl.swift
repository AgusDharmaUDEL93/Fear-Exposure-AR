//
//  LogRepositoryImpl.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 10/11/24.
//
import SwiftData
import Foundation

class LogRepositoryImpl : LogRepository {
    
    private let modelContainer : ModelContainer
    private let modelContext : ModelContext
    
    @MainActor
    static let shared = LogRepositoryImpl()
    
    @MainActor
    private init(){
        self.modelContainer = try! ModelContainer(for: PhobiaDto.self, AssessmentStatusDto.self, LogSessionDto.self)
        self.modelContext = modelContainer.mainContext
    }
    
    
    func addLog(log: LogSessionDto) {
        print("Log repository Data Get : \(log.phobiaName)")
        modelContext.insert(log)
    }
    
    func getLogById(id: UUID) throws -> LogSessionDto? {
        do {
            return try modelContext.fetch(FetchDescriptor<LogSessionDto>(predicate: #Predicate {value in value.logId == id} )).first
        } catch {
            throw error
        }
    }
    
    func getAllLog() throws -> [LogSessionDto] {
        do {
            return try modelContext.fetch(FetchDescriptor<LogSessionDto>(sortBy: [SortDescriptor(\.dateTime, order: .reverse)]))
        } catch {
            throw error
        }
    }
    
    
}
