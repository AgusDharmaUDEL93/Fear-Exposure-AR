//
//  Router.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 14/10/24.
//

import Observation
import SwiftUI

@Observable
class Router  {
    var navPath = NavigationPath()
    
    public enum Destination  : Codable, Hashable {
        case theraphy
        case reflection ( phobiaId : Int, heartRate : [Double], duration : Double)
        case arPlayground
        case picturePlayground
        case termCondition(isOnlyShowing : Bool = false)
        case introductionPhobia
        case assessment
        case recommendation
        case complete
        case about
        case detailResult (id : UUID)
        case privacyNotice
    }
    
    func navigate(to destination: Destination) {
        navPath.append(destination)
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}
