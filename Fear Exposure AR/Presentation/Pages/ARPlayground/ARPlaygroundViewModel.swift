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
    
    var phobia : Phobia = Phobia.initial
    
    var isScaleObject : Bool = false
    
    var errorMessage : String?
    
    var arState : ARState = .initial
    
    var isConfirmationDialogShow : Bool = false
    var isHideBackButton : Bool = false
    var timer : Timer?
    var timerCount : Double = 0.0
    @ObservationIgnored private let counter : Double = 1.0
    
    var isModalSheetOpen : Bool = false
    
    var heartRateData : [Double] = []
    
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
    
    @MainActor
    func onUpdateScale (id : Int, scale : Float) {
        let result = assessmentUseCases.getAssessmentStatus.execute(id: id)

        switch result {
            
        case .success(data: let data):
            if let assessment = data {
                let updatedData = AssessmentStatus(
                    phobiaId: assessment.phobiaId,
                    recommendation: assessment.recommendation,
                    scale: scale,
                    volume: assessment.volume,
                    isObjectFollowUser: assessment.isObjectFollowUser
                    
                )
                updateAssessment(updatedData: updatedData)
            }
        case .error(message: let message):
            errorMessage = message
        }
    }
    
    @MainActor
    private func updateAssessment (updatedData : AssessmentStatus){
        let result = assessmentUseCases.updateAssessmentStatus.execute(assessment:  updatedData)
        
        switch result {
            
        case .success(data: let data):
            print(data)
        case .error(message: let message):
            errorMessage = message
        }
    }
    
    func clearErrorMessage () {
        errorMessage = nil
    }
}
