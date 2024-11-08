//
//  AddPhobias.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 07/11/24.
//

class AddPhobias {
    private var phobiaRepository : PhobiaRepository
    
    init(phobiaRepository: PhobiaRepository) {
        self.phobiaRepository = phobiaRepository
    }
    
    func execute (id : Int) {
        phobiaRepository.addPhobias(phobia: id)
    }
}
