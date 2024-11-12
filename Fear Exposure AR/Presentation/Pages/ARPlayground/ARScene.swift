//
//  ARPlaygroundScene.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 14/10/24.
//

import ARKit
import RealityKit
import FocusEntity

class ARScene : ARView {
    
    var focusEntity : FocusEntity?
    private var followTimer: Timer?
    private let minimumDistance: Float = 1
    private let speed = 3
    
    required init(frame frameRect: CGRect) {
        super.init(frame: frameRect)
        
        focusEntity = FocusEntity(on: self, style: .classic(color: .yellow))
        
        config()
    }
    
    override init(frame frameRect: CGRect, cameraMode: ARView.CameraMode, automaticallyConfigureSession: Bool) {
        super.init(frame: frameRect, cameraMode: cameraMode, automaticallyConfigureSession: automaticallyConfigureSession)
        
        focusEntity = FocusEntity(on: self, style: .classic(color: .yellow))
        
        config()
    }
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
        
        focusEntity = FocusEntity(on: self, style: .classic(color: .yellow))
        
        config()
    }
    
    
    func startFollowingUser(fearedObject: FearedObject) {
        followTimer?.invalidate()
        
        followTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            self.updateObjectPosition(fearedObject: fearedObject)
        }
    }
    
    func stopFollowingUser() {
        followTimer?.invalidate()
        followTimer = nil
    }
    
    private func updateObjectPosition(fearedObject: FearedObject) {
        print("Here")
        guard let entity = fearedObject.baseModel else { return }
        
        let userPosition = cameraTransform.translation
        let objectPosition = entity.position(relativeTo: nil)
        
        let distance = simd_distance(userPosition, objectPosition)
        
        if distance <= minimumDistance {
            return
        }

        let direction = normalize(userPosition - objectPosition)
        let newPosition = objectPosition + direction * Float(speed) * 0.1
        
        
        let transform = Transform(scale: entity.scale, rotation: entity.transform.rotation, translation: newPosition)
        
        let resultan = sqrt(objectPosition.x * objectPosition.x + objectPosition.y * objectPosition.y + objectPosition.z * objectPosition.z)
        
        let duration =  TimeInterval(abs(resultan * Float(speed)))
        
        guard let animation = fearedObject.animation else { return }
        
        entity.playAnimation(animation.repeat())
        
        entity.move(to: transform, relativeTo: nil, duration: duration)
    }
    
    private func config () {
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal]
        config.environmentTexturing = .automatic
        config.frameSemantics.insert(.personSegmentationWithDepth)
        
        if (ARWorldTrackingConfiguration.supportsSceneReconstruction(.meshWithClassification)){
            config.sceneReconstruction = .meshWithClassification
        }
        self.session.run(config)
        
    }
    
}
