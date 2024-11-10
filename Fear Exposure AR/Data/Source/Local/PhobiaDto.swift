//
//  PhobiaDto.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 07/11/24.
//

import SwiftData

@Model
class PhobiaDto {
   var phobiaId : Int? // Unique
    
    init(phobiaId: Int? = nil) {
        self.phobiaId = phobiaId
    }
}