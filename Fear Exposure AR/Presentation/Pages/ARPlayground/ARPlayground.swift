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
    var onChangedLength : (Float) -> Void
    
    func makeUIView(context: Context) -> ARScene {
        let arView = ARScene(frame: .zero)
        
        context.coordinator.startSubscriptionIfNeeded(arView: arView, fearedObject: fearedObject, onChangedLength: onChangedLength)
        
        
        if let position = arView.focusEntity?.position {
            
            let lengthOnPixel = sqrt(position.x * position.x + position.y * position.y)
            let length = lengthOnPixel * 0.0002645833
            
            print(length)
            onChangedLength(length)
        }
        
        
        return arView
    }
    
    func updateUIView(_ uiView: ARScene, context: Context) {
        uiView.focusEntity?.isEnabled = !fearedObject.isActive
        
        if (fearedObject.isActive) {
            placeFearedObject(in: uiView)
            context.coordinator.stopSubscription()
            return
        }
        
        clearFearedObject(in: uiView)
        context.coordinator.startSubscriptionIfNeeded(arView: uiView, fearedObject: fearedObject, onChangedLength: onChangedLength)

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
    
    class Coordinator {
            var cancellable: Cancellable?
            
            func startSubscriptionIfNeeded(arView: ARScene, fearedObject: FearedObject, onChangedLength: @escaping (Float) -> Void) {
                // Start the subscription only if fearedObject is not active
                guard !fearedObject.isActive, cancellable == nil else { return }
                
                cancellable = arView.scene.subscribe(to: SceneEvents.Update.self) { event in
                    if let position = arView.focusEntity?.position {
                        let length = sqrt(position.x * position.x + position.y * position.y + position.z * position.z)
                        
                        // Print and update the length
                        print(length)
                        onChangedLength(length)
                    }
                }
            }
            
            func stopSubscription() {
                // Cancel the subscription if it exists
                cancellable?.cancel()
                cancellable = nil
            }
        }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    
    
    typealias UIViewType = ARScene
}
