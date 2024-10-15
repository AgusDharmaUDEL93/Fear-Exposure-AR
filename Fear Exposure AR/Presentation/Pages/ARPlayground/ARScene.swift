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
