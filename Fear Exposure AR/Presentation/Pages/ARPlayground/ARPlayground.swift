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
    @Binding var volume : Float
    
    func makeUIView(context: Context) -> ARScene {
        let arView = ARScene(frame: .zero)
        
        return arView
    }
    
    func updateUIView(_ uiView: ARScene, context: Context) {
        uiView.focusEntity?.isEnabled = !fearedObject.isActive
                
        guard let entity = fearedObject.baseModel else { return }
        
        guard let animation = fearedObject.animation else { return }
        
        
        if (entity.isAnchored) {
            uiView.audioController?.gain = volumeInDecibels(volume: Double(volume))
        }
        
        
        switch arState {
        case .placeObject:
            placeFearedObject(in: uiView)
            if let audio = fearedObject.audio {
                uiView.audioController = entity.prepareAudio(audio)
                uiView.audioController?.gain = volumeInDecibels(volume: Double(volume))
                uiView.audioController?.play()
            }
            
            if (isObjectFollowUser){
                arState = .objectFollowUser
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
            entity.playAnimation(animation.repeat())
            uiView.startFollowingUser(fearedObject: fearedObject)
            arState = .initial
        case .objectNotFollowUser:
            
            entity.stopAllAnimations()
            
            uiView.stopFollowingUser()
            arState = .initial
        }
        
    }
    
    private func volumeInDecibels(volume: Double) -> Double {
          return 20.0 * log10(volume)
      }

    
    
    private func placeFearedObject (in uiView : ARScene) {
        
        guard let entity = fearedObject.baseModel else { return }
        
        
        let entityAnchor = AnchorEntity(world: uiView.focusEntity?.position ?? SIMD3(x: 0, y: 0, z: 0) )
        
        let initialScale = SIMD3<Float>(repeating: (scale * 100) + 1)
        
        entity.transform = Transform(scale: initialScale, rotation: entity.transform.rotation, translation: SIMD3(x: 0, y: 0, z: 0))
        
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
