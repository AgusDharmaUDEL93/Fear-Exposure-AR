//
//  GetPhobiaById.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 08/11/24.
//


class GetPhobiaById {
    private let phobiaRepository : PhobiaRepository
    
    init(phobiaRepository: PhobiaRepository) {
        self.phobiaRepository = phobiaRepository
    }
    
    func execute (id : Int) -> Phobia? {
        return phobiaRepository.getPhobiasById(phobia: id)
    }
}
