//
//  PhobiaRepositoryImpl.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 07/11/24.
//

import SwiftData
import Foundation

class PhobiaRepositoryImpl : PhobiaRepository {
    
    private let modelContainer : ModelContainer
    private let modelContext : ModelContext
    
    @MainActor
    static let shared = PhobiaRepositoryImpl()
    
    @MainActor
    private init(){
        self.modelContainer = try! ModelContainer(for: PhobiaDto.self)
        self.modelContext = modelContainer.mainContext
    }
    
    func addPhobias(phobia: Int) {
        modelContext.insert(PhobiaDto(phobiaId: phobia))
    }
    
    func deletePhobias(phobia: Int ) throws {
        do {
            modelContext.delete(try getPhobiaSelected().first(where: {value in value.phobiaId == phobia} ) ?? PhobiaDto(phobiaId: phobia))
            try modelContext.save()
        } catch {
            throw error
        }
    }
    
    func getAllPhobias() -> [Phobia] {
        return phobiasData
    }
    
    func getPhobiasById (phobia : Int) -> Phobia? {
        return phobiasData.first(where: {
            $0.id == phobia
        }) ?? nil
    }
    
    func getPhobiaSelected() throws  -> [PhobiaDto] {
        do {
            return try modelContext.fetch(FetchDescriptor<PhobiaDto>())
        } catch {
            throw error
        }
    }
    
}
