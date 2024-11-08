//
//  SettingARUtils.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 07/11/24.
//

/**
 
 - Object : FearedObject
 - Scale : Float
 - Volume : Float
 - Object Follow User : Boolean
 
 */

import Observation

@Observable
class SettingARUtils {
    var object : FearedObject?
    var scale : Float = 1
    var volume : Float = 0
    var isObjectFollowUser : Bool = false
}
