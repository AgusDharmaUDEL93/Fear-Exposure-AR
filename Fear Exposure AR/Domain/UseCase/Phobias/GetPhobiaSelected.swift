//
//  GetSelectedPhobia.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 07/11/24.
//

class GetPhobiaSelected {
    private var phobiaRepository : PhobiaRepository
    
    init(phobiaRepository: PhobiaRepository) {
        self.phobiaRepository = phobiaRepository
    }
    
    func execute () -> [Int] {
        do {
            return (try phobiaRepository.getPhobiaSelected().map({
                $0.phobiaId
            }))
        } catch {
            return []
        }
    }
}
