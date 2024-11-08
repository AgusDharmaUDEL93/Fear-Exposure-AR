//
//  AssessmentStatusRepositoryImpl.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 08/11/24.
//
import SwiftData

class AssessmentStatusRepositoryImpl : AssessmentStatusRepository {
    
    private let modelContainer : ModelContainer
    private let modelContext : ModelContext
    
    @MainActor
    static let shared = AssessmentStatusRepositoryImpl()
    
    @MainActor
    private init(){
        self.modelContainer = try! ModelContainer(for: PhobiaDto.self)
        self.modelContext = modelContainer.mainContext
    }
    
    func getAssessmentStatus(id: Int) throws -> AssessmentStatusDto? {
        do {
            return (try modelContext.fetch(FetchDescriptor<AssessmentStatusDto>())).first(where: { $0.phobiaId == id})
        } catch {
            throw error
        }
    }
    
    func updateAssessmentStatus(assessment: AssessmentStatus) throws {
        
        do {
            modelContext.delete(try getAssessmentStatus(id: assessment.phobiaId ?? -1) ?? AssessmentStatusDto(phobiaId: -1))
            modelContext.insert(assessment.toAssessmentStatusDto())
            try modelContext.save()
        } catch {
            throw error
        }
    }
    
    
}
