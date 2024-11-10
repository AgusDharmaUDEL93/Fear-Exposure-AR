//
//  SettingsARViewModel.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 30/10/24.
//
import Observation

@Observable
class SettingsARViewModel {
    var sliderValue : Float = 0
    var isObjectFollow : Bool = false
    
    func setSettingValue (sliderValue : Float, isObjectFollow : Bool) {
        self.sliderValue = sliderValue
        self.isObjectFollow = isObjectFollow
    }
}
