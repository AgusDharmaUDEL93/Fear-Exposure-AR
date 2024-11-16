//
//  PicturePlaygroundViewModel.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 14/10/24.
//

import Observation
import Foundation
import RealityKit

@Observable
class PicturePlaygroundViewModel {
    @MainActor
    @ObservationIgnored
    private let phobiaUseCases = PhobiasUseCases.shared
    
    var currentZoom = 0.0
    var totalZoom = 1.0
    
    @ObservationIgnored private let maxZoom = 1.0
    @ObservationIgnored private let minZoom = 0.0
    
    var isConfirmationDialogShow : Bool = false
    var isObjectReveal : Bool = false
    
    var timer : Timer?
    var timerCount : Double = 0.0
    @ObservationIgnored private let counter : Double = 1.0
    
    var heartRateData : [Double] = []

    var phobia : Phobia = Phobia.initial
    
    @MainActor
    func getPhobiaById (id : Int){
        if let data = phobiaUseCases.getPhobiaById.execute(id: id) {
            phobia = data
        }
    }
    
    func onChangedHeartRateData (value : Double){
        if (value != 0){
            heartRateData.append(value)
        }
    }

    func toogleConfirmationDialog () {
        isConfirmationDialogShow = !isConfirmationDialogShow
    }
    
    func onRevealObject () {
        isObjectReveal = true
    }
    
    func onDisapearObject () {
        isObjectReveal = false
    }
    
    func onMagnifierGesture (value : Double) {
        let delta = value - totalZoom
        
        let newZoom = currentZoom + delta
        if newZoom >= minZoom && newZoom <= maxZoom {
            currentZoom = newZoom
        }
        
        totalZoom = value
    }
    
    func onEndedMagnifier () {
        totalZoom = 1.0
    }
    
    func onResetZoom () {
        currentZoom = minZoom
    }
    
    
    func countTimer () {
        timerCount += counter
    }
    
    func resetTimer () {
        timerCount = 0
    }
    
    func startTimer (block : @escaping (Timer) -> Void) {
        timer = Timer.scheduledTimer(withTimeInterval: counter, repeats: true, block: block)
        
    }
    
    func stopTimer () {
        timer?.invalidate()
    }
}
