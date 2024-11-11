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
    
    var timer : Timer?
    @ObservationIgnored let maxTimer : Double = 5.0
    var timerCount : Double = 0.0
    @ObservationIgnored private let counter : Double = 1.0
    
    init() {
        timerCount = maxTimer
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
    
}
