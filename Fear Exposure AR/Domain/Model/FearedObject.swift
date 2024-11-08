//
//  FearedObject.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 14/10/24.
//
import RealityKit

struct FearedObject {
    var baseModel : ModelEntity?
    var animation : AnimationResource?
    var isActive : Bool = false
    var image : String?
    var audio : AudioResource?
}
