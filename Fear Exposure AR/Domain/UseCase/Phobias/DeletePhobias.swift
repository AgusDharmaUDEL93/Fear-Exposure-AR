//
//  DeletePhobias.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 07/11/24.
//

class DeletePhobias {
    private var phobiaRepository : PhobiaRepository
    
    init(phobiaRepository: PhobiaRepository) {
        self.phobiaRepository = phobiaRepository
    }
    
    func execute (id : Int) {
        do {
            try phobiaRepository.deletePhobias(phobia: id )
        } catch {
            // TODO : Error Handling
        }
    }
}
