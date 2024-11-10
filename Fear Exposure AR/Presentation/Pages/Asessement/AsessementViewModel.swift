//
//  AsessementViewModel.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 31/10/24.
//

import Observation

@Observable
class AsessementViewModel {
    var answers: [Int] = []
    var recommendation: String? = nil

    func onChangedAnswer (answer : Int) {
        answers.append(answer)
    }
    
    func allQuestionsAnswered() -> Bool {
        return answers.count == 8
    }
    
    func processAnswers() {
        // Expert system logic to determine recommendation based on answers
        var score = 0
        
        if (answers.count != 7) {
            return
        }
        
        // Assign scores based on intensity of fear
            switch answers[0] {
            case 0:
                score += 0
            case 1:
                score += 1
            case 2:
                score += 2
            case 3:
                score += 3
            default:
                break
            }
        
        
        // Add scores for physical symptoms, therapy, and mental health conditions
        if answers[1] == 0 { score += 2 }
        if answers[2] == 0 { score += 1 }
        if answers[3] == 0 { score += 1 }
        
        // Technical willingness assessment
        var technicalScore = 0
        if answers[4] == 0 { technicalScore += 1 }
        if answers[5] == 0 { technicalScore += 2 }
        if answers[6] == 0 { technicalScore += 3 }
        
        // Determine recommendation based on scores
        if technicalScore >= 5 && score >= 5 {
            recommendation = "AR Moving"
        } else if technicalScore >= 3 && score >= 3 {
            recommendation = "AR Static"
        } else{
            recommendation = "Picture"
        } 
    }
    
}
