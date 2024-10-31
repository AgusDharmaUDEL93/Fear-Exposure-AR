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
    
    func makeUIView(context: Context) -> ARScene {
        let arView = ARScene(frame: .zero)
        
        return arView
    }
    
    func updateUIView(_ uiView: ARScene, context: Context) {
        uiView.focusEntity?.isEnabled = !fearedObject.isActive
        
        if (fearedObject.isActive) {
            placeFearedObject(in: uiView)
            return
        }
        
        clearFearedObject(in: uiView)

    }
    
    
    
    private func placeFearedObject (in uiView : ARScene) {
        
        guard let entity = fearedObject.baseModel else { return }
        
        let entityAnchor = AnchorEntity(world: uiView.focusEntity?.position ?? SIMD3(x: 0, y: 0, z: 0) )
        
        entityAnchor.addChild(entity)
        
        uiView.scene.addAnchor(entityAnchor)
        
        guard let animation = fearedObject.animation else { return }
        
        entity.playAnimation(animation.repeat())
        
        
    }
    
    
    
    private func clearFearedObject (in uiView : ARScene){
        
        guard let entity = fearedObject.baseModel else { return }
        
        if let anchorEntity = entity.anchor {
            uiView.scene.removeAnchor(anchorEntity)
        }
    }
    
    
    typealias UIViewType = ARScene
}
