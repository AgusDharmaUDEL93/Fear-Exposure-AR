//
//  PicturePlaygroundViewModel.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 14/10/24.
//

import Observation

@Observable
class PicturePlaygroundViewModel {
    var currentZoom = 0.0
    var totalZoom = 1.0
    
    func onChangedZoom (_ value : Double) {
        currentZoom = value - 1
    }
    
    func onEndedZoom () {
        totalZoom += currentZoom
        currentZoom = 0
    }
    
    func onResetZoom () {
        currentZoom = 0.0
        totalZoom = 1.0
    }
}
