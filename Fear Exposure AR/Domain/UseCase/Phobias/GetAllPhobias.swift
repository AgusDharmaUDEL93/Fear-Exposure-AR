//
//  GetAllPhobias.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 07/11/24.
//

class GetAllPhobias {
    private let phobiaRepository : PhobiaRepository
    
    init(phobiaRepository: PhobiaRepository) {
        self.phobiaRepository = phobiaRepository
    }
    
    func execute(
        listId : [Int] = []
    ) -> [Phobia]{
        
        if (listId.isEmpty){
            return phobiaRepository.getAllPhobias()
        }
        
        return phobiaRepository.getAllPhobias().filter({value in listId.contains(value.id)})
    }
}
