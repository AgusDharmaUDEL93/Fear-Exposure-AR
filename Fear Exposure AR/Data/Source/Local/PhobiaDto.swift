//
//  PhobiaDto.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 07/11/24.
//

import SwiftData

@Model
class PhobiaDto {
    @Attribute(.unique) var phobiaId : Int
    
    init(phobiaId: Int) {
        self.phobiaId = phobiaId
    }
}
