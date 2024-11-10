//
//  AsessementScreen.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 31/10/24.
//

import SwiftUI

struct AsessementScreen : View {
    
    @Environment(Router.self) private var router
    @State var viewModel : AsessementViewModel  = AsessementViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            
            VStack {
                TitleScreen(
                    title: "Fear Asessement",
                    description: "Please complete this assessment form to help us tailor the therapy to your specific needs."
                )
                ScrollView {
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
                                question: "Are you willing to be exposed to a 3D representation of the feared object using Augmented reality?",
                                options: [
                                    "Yes", "No"
                                ],
                                onChangedSelectedOption: { data in
                                    
                                }
                            )
                            
                            
                            QuestionAsessement(
                                number: 3,
                                question: "Are you willing to have the 3D object approach to you?",
                                options: [
                                    "Yes", "No"
                                ],
                                onChangedSelectedOption: { data in
                                    
                                }
                            )
                        }
                        
                        Spacer()
                            .frame(height: 48)
                            .frame(maxWidth: geometry.size.width)
                        
                        
                        Divider()
                        Spacer()
                            .frame(height: 16)
                        Button(action: {
                            router.navigate(to: .theraphyType)
                        }, label: {
                            Text ("Submit")
                                .font(.body)
                                .bold()
                                .frame(maxWidth: geometry.size.width)
                                .padding(.vertical, 6)
                        })
                        .buttonStyle(.borderedProminent)
                        .background(Color(Theme.background.rawValue))
                        .frame(maxWidth: .infinity)
                        Spacer()
                            .frame(height: 32)
                            .frame(maxWidth: geometry.size.width)
                        
                    }
                    .padding(.horizontal, 16)
                    .frame(maxWidth: geometry.size.width)
                }
            }
            
        }
        .navigationBarBackButtonHidden()
        .toolbar(content: {
            ToolbarItem(placement : .topBarLeading){
                Button(action: {
                    router.navigateBack()
                }, label: {
                    HStack {
                        Image(systemName: "chevron.left")
                    }
                    
                })
                .foregroundStyle(.white)
                Spacer()
            }
        })
        .ignoresSafeArea()
        
    }
}

#Preview {
    NavigationStack {
        AsessementScreen()
    }
    .accentColor(Color(Theme.primary500.rawValue))
    .environment(Router())
}
