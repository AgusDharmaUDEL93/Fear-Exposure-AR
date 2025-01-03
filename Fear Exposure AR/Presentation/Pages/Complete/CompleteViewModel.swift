//
//  CompleteViewModel.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 11/11/24.
//
import Observation
import Foundation

@Observable
class CompleteViewModel {
    
    @MainActor
    private var logUseCases = LogUseCases.shared
    
    var timer : Timer?
    @ObservationIgnored let maxTimer : Double = 5.0
    var timerCount : Double = 0.0
    @ObservationIgnored private let counter : Double = 1.0
    
    var errorMessage : String?
    
    var resultId : UUID?
    
    init() {
        timerCount = maxTimer
    }
    
    @MainActor
    func getResultId () {
        
        let result = logUseCases.getAllLogs.execute()
        
        switch result {
        case .success(data: let data):
            resultId = data.first?.logId
        case .error(message: let message):
            errorMessage = message
        }
    }
    
    
    func countTimer () {
        timerCount -= counter
    }
    
    func resetTimer () {
        timerCount = 0
    }
    
    func startTimer (block : @escaping (Timer) -> Void) {
        timer = Timer.scheduledTimer(withTimeInterval: counter, repeats: true, block: block)
        
    }
    
    func stopTimer () {
        timer?.invalidate()
    }
    
    func clearErrorMessage () {
        errorMessage = nil
    }
    
}
