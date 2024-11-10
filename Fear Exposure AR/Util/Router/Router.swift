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
        case theraphyType
        case reflection
        case summary
        case arPlayground
        case picturePlayground
        case userInfo
        case termCondition(isOnlyShowing : Bool = false)
        case introductionPhobia
        case assessment
        case recommendation
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
