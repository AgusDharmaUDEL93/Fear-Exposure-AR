//
//  SettingUtils.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 09/11/24.
//

import Observation

@Observable
class  SettingUtils {
    var phobiaId : Int = -1
    var recommendation : Recommendation = .picture
    var scale : Float = 0
    var volume : Float = 0.5
    var isObjectFollowUser : Bool = false
}
