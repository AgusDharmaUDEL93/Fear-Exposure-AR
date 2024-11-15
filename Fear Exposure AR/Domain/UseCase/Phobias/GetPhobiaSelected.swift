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
    
    func execute () -> Result<[Int]> {
        do {
            
            let data = (try phobiaRepository.getPhobiaSelected().map({
                $0.phobiaId ?? -1
            })).filter({
                $0 != -1
            })
            
            return Result.success(data: data)
        } catch {
            return Result.error(message: "Cannot get phobia")
        }
    }
}
