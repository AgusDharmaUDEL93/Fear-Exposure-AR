//
//  ARPlaygroundViewModel.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 14/10/24.
//


import Observation
import Combine
import RealityKit
import ARKit
import SceneKit

@Observable
class ARPlaygroundViewModel {
    var fearedObject : FearedObject = FearedObject()
    var errorMessage : String?
    var isConfirmationDialogShow : Bool = false
    var isHideBackButton : Bool = false
    var timer : Timer?
    @ObservationIgnored private let maxTimer : Double = 30.0
    var timerCount : Double = 0.0
    @ObservationIgnored private let counter : Double = 1.0
    
    init() {
        getFearedObject()
        timerCount = maxTimer
    }
    
    private func getFearedObject ()  {
        fearedObject.baseModel = try? ModelEntity.loadModel(named: "base_snake.usdz")
        fearedObject.animation = try? ModelEntity.loadModel(named: "animation_snake.usdz").availableAnimations.first
    }
    
    func placeItem (){
        fearedObject.isActive = true
    }
    
    func clearItem () {
        fearedObject.isActive = false
    }
    
    func toogleConfirmationDialog () {
        isConfirmationDialogShow = !isConfirmationDialogShow
    }
    
    func hideBackButton () {
        isHideBackButton = true
    }
    
    func countTimer () {
        timerCount -= counter
    }
    
    func resetTimer () {
        timerCount = maxTimer
    }
    
    func startTimer (block : @escaping (Timer) -> Void) {
        timer = Timer.scheduledTimer(withTimeInterval: counter, repeats: true, block: block)
        
    }
    
    @objc func fireTimer() {
        print("Timer fired!")
    }
    
    func stopTimer () {
        timer?.invalidate()
    }
    
}
