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
    
    @MainActor
    @ObservationIgnored private let phobiaUseCases = PhobiasUseCases.shared
    @MainActor
    @ObservationIgnored private let assessmentUseCases = AssessmentStatusUseCases.shared
    
    var phobia : Phobia = Phobia(
        id: 0,
        name: "Ophidiophobia",
        displayName: "Snakes",
        isAnimal: true,
        description: "Intense fear of Snakes",
        fearedObject: FearedObject(
            baseModel: try? ModelEntity.loadModel(named: "base_snake.usdz"),
            animation: try? ModelEntity.loadModel(named: "animation_snake.usdz").availableAnimations.first
        )
    )
    
    var isScaleObject : Bool = false
    
    var arState : ARState = .initial
    
    var isConfirmationDialogShow : Bool = false
    var isHideBackButton : Bool = false
    var timer : Timer?
    var timerCount : Double = 0.0
    @ObservationIgnored private let counter : Double = 1.0
    
    var isModalSheetOpen : Bool = false
    
    @MainActor
    func getPhobiaById (id : Int){
        if let data = phobiaUseCases.getPhobiaById.execute(id: id) {
            phobia = data
        }
    }
    
    
    func placeItem (){
        arState = .placeObject
        phobia.fearedObject.isActive = true
    }
    
    func clearItem () {
        arState = .clearObject
        phobia.fearedObject.isActive = false
    }
    
    func toogleConfirmationDialog () {
        isConfirmationDialogShow = !isConfirmationDialogShow
    }
    
    func hideBackButton () {
        isHideBackButton = true
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
    
    func openModalSheet () {
        isModalSheetOpen = true
    }
    
    func closeModalSheet() {
        isModalSheetOpen = false
    }
    
    func isDoneScaleObject () {
        arState = .initial
        isScaleObject = false
    }
    
    func onScaledObject () {
        isScaleObject = true
        arState = .changeScale

    }
    
    func onObjectIsFollowUser () {
        arState = .objectFollowUser
    }
    
    func onObjectIsNotFollowUser () {
        arState = .objectNotFollowUser
    }
}
