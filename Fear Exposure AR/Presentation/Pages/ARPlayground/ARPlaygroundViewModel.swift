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
    
    init() {
       getFearedObject()
    }
        
    private func getFearedObject ()  {
        fearedObject.baseModel = try? ModelEntity.loadModel(named: "base_snake.usdc")
//        fearedObject.animation = try? ModelEntity.loadModel(named: "kucheng_eat_animation.usdz").availableAnimations.first
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
    

}
