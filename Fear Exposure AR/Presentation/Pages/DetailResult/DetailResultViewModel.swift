//
//  DetailResultViewModel.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 11/11/24.
//

import Observation
import Foundation

@Observable
class DetailResultViewModel {
    
    @MainActor
    @ObservationIgnored
    private var logUseCases = LogUseCases.shared
    
    var log : LogSession = LogSession(
        phobiaName: "Arachnophobia", dateTime: Date.now , duration: 120, feelingDuring: .frightened, notes: "Today’s session went better than I expected. I managed to look at photos of small spiders without that usual rush of panic.", heartRate: [90, 80, 94, 97, 93]
        
    )
    
    @MainActor
    func getLogById (id : UUID) {
        if let logData = logUseCases.getLogById.execute(id: id){
            log = logData
        }
    }
}
