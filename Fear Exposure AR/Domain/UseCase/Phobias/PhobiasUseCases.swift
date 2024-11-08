//
//  PhobiasUseCases.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 07/11/24.
//

@MainActor
class PhobiasUseCases {
    let addPhobia = AddPhobias(phobiaRepository: PhobiaRepositoryImpl.shared)
    
    let deletePhobia = DeletePhobias(phobiaRepository: PhobiaRepositoryImpl.shared)
    
    let getPhobiaSelected = GetPhobiaSelected(phobiaRepository: PhobiaRepositoryImpl.shared)
    
    let getAllPhobia = GetAllPhobias(phobiaRepository: PhobiaRepositoryImpl.shared)
    
    let getPhobiaById = GetPhobiaById(phobiaRepository: PhobiaRepositoryImpl.shared)
    
    static let shared = PhobiasUseCases()
}
