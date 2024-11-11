//
//  ReflectionViewModel.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 15/10/24.
//

import Observation

@Observable
class ReflectionViewModel {
    
    @MainActor
    @ObservationIgnored
    private let logUseCases = LogUseCases.shared
    
    var isActiveArray = [false, false, false, false, false]
    var notes = ""
    
    var feelingBeforeSelected : Feeling = .unknown
    var feelingAfterSelected : FeelingAfter = .unknown
    
    func onChangedIsActiveStatus (targetIndex : Int) {
        if (targetIndex > 4) {
            return
        }
        
        isActiveArray = [false, false, false, false, false]
        
        isActiveArray[targetIndex] = true
        
    }
    
    @MainActor
    func onSubmitData(phobiaId : Int, heartRate : [Double], duration : Double) {
        logUseCases.addLog.execute(
            log: LogSession(
                phobiaId: phobiaId,
                duration: duration,
                feelingDuring: feelingBeforeSelected,
                feelingAfter: feelingAfterSelected,
                notes: notes,
                heartRate: heartRate
            )
        )
    }
}
