//
//  AsessementScreen.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 31/10/24.
//

import SwiftUI

struct AsessementScreen : View {
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                TitleScreen(
                    title: "Fear Asessement",
                    description: "Please complete this assessment form to help us tailor the therapy to your specific needs."
                )
                
                VStack (alignment : .leading) {
                    Spacer()
                        .frame(height: 32)
                        .frame(maxWidth: geometry.size.width)
                    
                    Text("Question Category")
                        .font(.title3)
                        .bold()
                        .padding(.bottom, 12)
                    
                    VStack(spacing: 28) {
                        QuestionAsessement(
                            number: 1,
                            question: "How intense is your fear when exposed to the object?",
                            options: [
                                "None", "Slightly", "Mild", "Terrified"
                            ],
                            onChangedSelectedOption: { data in
                                
                            }
                        )
                        
                        QuestionAsessement(
                            number: 2,
                            question: "When in fear, I experience physical symptoms (sweating, rapid heartbeat, shortness of breath).",
                            options: [
                                "Yes", "No"
                            ],
                            onChangedSelectedOption: { data in
                                
                            }
                        )
                        
                        QuestionAsessement(
                            number: 3,
                            question: "I have tried attending therapy to help manage my phobia.",
                            options: [
                                "Yes", "No"
                            ],
                            onChangedSelectedOption: { data in
                                
                            }
                        )
                        
                        QuestionAsessement(
                            number: 4,
                            question: "I have other mental health conditions that might affect my phobia.",
                            options: [
                                "Yes", "No"
                            ],
                            onChangedSelectedOption: { data in
                                
                            }
                        )
                    }
                    Spacer()
                        .frame(height: 32)
                    
                    Spacer()
                        .frame(height: 32)
                        .frame(maxWidth: geometry.size.width)
                    
                    Text("Technical Assessment")
                        .font(.title3)
                        .bold()
                        .padding(.bottom, 12)
                    
                    VStack(spacing: 28) {
                        QuestionAsessement(
                            number: 1,
                            question: "Are you willing to be exposed to a 2D cartoon image of the feared object.",
                            options: [
                                "Yes", "No"
                            ],
                            onChangedSelectedOption: { data in
                                
                            }
                        )
                        
                        QuestionAsessement(
                            number: 2,
                            question: "Are you willing to be exposed to a **3D representation** of the feared object using Augmented reality?",
                            options: [
                                "Yes", "No"
                            ],
                            onChangedSelectedOption: { data in
                                
                            }
                        )
                        
                        QuestionAsessement(
                            number: 3,
                            question: "You are **scared by the sound** that the feared object makes.",
                            options: [
                                "Yes", "No"
                            ],
                            onChangedSelectedOption: { data in
                                
                            }
                        )
                        
                        QuestionAsessement(
                            number: 4,
                            question: "How comfortable are you **being close** to the feared object? (m = meters).",
                            options: [
                                "Not comfortable!", "Keep it far (5 m)", "A little close (3 m)", "I dare it! (1 m)"
                            ],
                            onChangedSelectedOption: { data in
                                
                            }
                        )
                        
                        QuestionAsessement(
                            number: 5,
                            question: "Are you willing to have the 3D object approach to you?",
                            options: [
                                "Yes", "No"
                            ],
                            onChangedSelectedOption: { data in
                                
                            }
                        )
                    }
                    
                    Spacer()
                        .frame(height: 32)
                        .frame(maxWidth: geometry.size.width)
                }
                .padding(.horizontal, 16)
                .frame(maxWidth: geometry.size.width)
            }
        }
    }
}

#Preview {
    NavigationStack {
        AsessementScreen()
    }
    .accentColor(Color(Theme.primary500.rawValue))
    .environment(Router())
}
