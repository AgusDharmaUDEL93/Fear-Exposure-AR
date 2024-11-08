//
//  PhobiaRepository.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 07/11/24.
//

protocol PhobiaRepository {
    
    func getAllPhobias () -> [Phobia]
    
    func addPhobias(
        phobia : Int
    )
    
    func deletePhobias (
        phobia : Int
    ) throws
    
    func getPhobiaSelected () throws -> [PhobiaDto] 
}
