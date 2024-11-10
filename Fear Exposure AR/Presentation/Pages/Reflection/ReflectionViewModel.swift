//
//  ReflectionViewModel.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 15/10/24.
//

import Observation

@Observable
class ReflectionViewModel {
    var isActiveArray = [false, false, false, false, false]
    var beforeText = ""
    var afterText = ""
    
    var feelingBeforeSelected : Feeling = .unknown
    var feelingAfterSelected : FeelingAfter = .unknown
    
    func onChangedIsActiveStatus (targetIndex : Int) {
        if (targetIndex > 4) {
            return
        }
        
        isActiveArray = [false, false, false, false, false]
        
        isActiveArray[targetIndex] = true
        
    }
}
