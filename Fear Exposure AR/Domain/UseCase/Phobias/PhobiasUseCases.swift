//
//  PhobiasUseCases.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 07/11/24.
//

class PhobiasUseCases {
    @MainActor
    let addPhobia = AddPhobias(phobiaRepository: PhobiaRepositoryImpl.shared)
    
    @MainActor
    let deletePhobia = DeletePhobias(phobiaRepository: PhobiaRepositoryImpl.shared)
    
    @MainActor
    let getPhobiaSelected = GetPhobiaSelected(phobiaRepository: PhobiaRepositoryImpl.shared)
    
    @MainActor
    let getAllPhobia = GetAllPhobias(phobiaRepository: PhobiaRepositoryImpl.shared)
    
    static let shared = PhobiasUseCases()
}
