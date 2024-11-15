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
    
    func execute (id : Int) -> Result<String?> {
        do {
            try phobiaRepository.deletePhobias(phobia: id )
            
            return Result.success(data: "Success delete phobia")
        } catch {
            // TODO : Error Handling
            return Result.error(message: "Cannot delete phobia")
        }
    }
}
