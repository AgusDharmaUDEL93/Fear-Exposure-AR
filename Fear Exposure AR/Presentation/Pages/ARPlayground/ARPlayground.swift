//
//  ARPlaygroundScreen.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 14/10/24.
//

import SwiftUI
import RealityKit
import ARKit
import Combine


struct ARPlayground : UIViewRepresentable {
    
    @Binding var fearedObject : FearedObject
    @Binding var scale : Float
    @Binding var isObjectFollowUser : Bool
    @Binding var arState : ARState
    
    
    func makeUIView(context: Context) -> ARScene {
        let arView = ARScene(frame: .zero)
        
        return arView
    }
    
    func updateUIView(_ uiView: ARScene, context: Context) {
        uiView.focusEntity?.isEnabled = !fearedObject.isActive
        
        switch arState {
        case .placeObject:
            placeFearedObject(in: uiView)
            if (isObjectFollowUser){
                arState = .objectFollowUser
                
                guard let entity = fearedObject.baseModel else { return }
                
                guard let animation = fearedObject.animation else { return }
                
                entity.playAnimation(animation.repeat())
            } else {
                arState = .initial
            }
        case .clearObject:
            clearFearedObject(in: uiView)
            arState = .initial
        case .changeScale:
            onScaleObject()
        case .initial:
            break
        case .objectFollowUser:
            print("Object Follow")
            guard let entity = fearedObject.baseModel else { return }
            
            guard let animation = fearedObject.animation else { return }
            
            entity.playAnimation(animation.repeat())

            uiView.startFollowingUser(fearedObject: fearedObject)
            arState = .initial
        case .objectNotFollowUser:
            guard let entity = fearedObject.baseModel else { return }

            entity.stopAllAnimations()
            
            uiView.stopFollowingUser()
            arState = .initial
        }
        
        
        
    }
    
    
    private func placeFearedObject (in uiView : ARScene) {
        
        guard let entity = fearedObject.baseModel else { return }
      
        
        let entityAnchor = AnchorEntity(world: uiView.focusEntity?.position ?? SIMD3(x: 0, y: 0, z: 0) )
        
        entity.transform = Transform(scale: entity.transform.scale, rotation: entity.transform.rotation, translation: SIMD3(x: 0, y: 0, z: 0))
        
        
        entityAnchor.addChild(entity)
        
        uiView.scene.addAnchor(entityAnchor)
        
     
        
    }
    
    private func onScaleObject () {
        guard let entity = fearedObject.baseModel else { return }
        entity.scale = SIMD3<Float>(repeating: (scale * 100) + 1)
    }

    
    private func clearFearedObject (in uiView : ARScene){
        
        guard let entity = fearedObject.baseModel else { return }
        
        if let anchorEntity = entity.anchor {
            uiView.scene.removeAnchor(anchorEntity)
        }
        
    }
    
    
    typealias UIViewType = ARScene
}
