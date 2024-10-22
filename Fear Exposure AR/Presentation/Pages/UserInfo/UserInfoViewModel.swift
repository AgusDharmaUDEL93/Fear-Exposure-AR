//
//  UserInfoViewModel.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 21/10/24.
//

import Observation

@Observable
class UserInfoViewModel {
    var name : String = ""
    var age : String = ""
    var gender : String = "Men"
    
    var genders  = ["Men", "Female"]
    
}
