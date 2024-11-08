//
//  ContentViewViewModel.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 08/11/24.
//

import Observation

@Observable
class ContentViewViewModel {
    @MainActor
    @ObservationIgnored private var phobiaUseCases = PhobiasUseCases.shared
    
    @MainActor
    func getPhobiaSelected () -> [Int] {
        return phobiaUseCases.getPhobiaSelected.execute()
    }
}
