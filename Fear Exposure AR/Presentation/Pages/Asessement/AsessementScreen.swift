//
//  AsessementScreen.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 31/10/24.
//

import SwiftUI

struct AsessementScreen : View {
    
    @Environment(Router.self) private var router
    @Environment(SettingUtils.self) private var settings
    @State var viewModel : AsessementViewModel  = AsessementViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            
            VStack {
                TitleScreen(
                    title: String(localized:  "Fear Assessement"),
                    description: String(localized:  "Please complete this assessment form to help us tailor the therapy to your specific needs.")
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
                            
                            // 1
                            QuestionAsessement(
                                number: 1,
                                question: String(localized: "How intense is your fear when exposed to the object?"),
                                options: [
                                    String(localized:  "None"), String(localized: "Slightly"), String(localized: "Mild"), String(localized:  "Terrified")
                                ],
                                onChangedSelectedOption: { data in
                                    viewModel.onChangedAnswer(number: 1, answer: data)
                                }
                            )
                            // 2
                            QuestionAsessement(
                                number: 2,
                                question: String(localized: "When in fear, I experience physical symptoms (sweating, rapid heartbeat, shortness of breath)."),
                                options: [
                                    String(localized: "Yes"), String(localized: "No")
                                ],
                                onChangedSelectedOption: { data in
                                    viewModel.onChangedAnswer(number: 2, answer: data)
                                }
                            )
                            
                            // 3
                            QuestionAsessement(
                                number: 3,
                                question: String(localized: "I have tried attending therapy to help manage my phobia."),
                                options: [
                                    String(localized: "Yes"), String(localized: "No")
                                ],
                                onChangedSelectedOption: { data in
                                    viewModel.onChangedAnswer(number: 3, answer: data)
                                }
                            )
                            
                            // 4
                            QuestionAsessement(
                                number: 4,
                                question: String(localized: "I have other mental health conditions that might affect my phobia."),

                                options: [
                                    String(localized: "Yes"), String(localized: "No")
                                ],
                                onChangedSelectedOption: { data in
                                    viewModel.onChangedAnswer(number: 4, answer: data)
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
                            
                            // 5
                            QuestionAsessement(
                                number: 1,
                                question: String(localized: "Are you willing to be exposed to a 2D cartoon image of the feared object."),
                                options: [
                                    String(localized: "Yes"), String(localized: "No")
                                ],
                                onChangedSelectedOption: { data in
                                    viewModel.onChangedAnswer(number: 5, answer: data)
                                }
                            )
                            
                            // 6
                            QuestionAsessement(
                                number: 2,
                                question: String(localized: "Are you willing to be exposed to a 3D representation of the feared object using Augmented reality?"),
                                options: [
                                    String(localized: "Yes"), String(localized: "No")
                                ],
                                onChangedSelectedOption: { data in
                                    viewModel.onChangedAnswer(number: 6, answer: data)
                                }
                            )
                            
                            // 7
                            QuestionAsessement(
                                number: 3,
                                question: String(localized: "Are you willing to have the 3D object approach to you?"),
                                options: [
                                    String(localized: "Yes"), String(localized: "No")
                                ],
                                onChangedSelectedOption: { data in
                                    viewModel.onChangedAnswer(number: 7, answer: data)
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
                            viewModel.processAnswers(id: settings.phobiaId)
                            router.navigate(to: .recommendation)
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
                        .disabled(viewModel.answers.count != 7)
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
        .alert(
            "Error",
            isPresented: Binding(
                get: {
                    viewModel.errorMessage != nil
                },
                set: { _ in
                    
                }
            ),
            actions: {
                Button(
                    role: .cancel,
                    action: {
                        viewModel.clearErrorMessage()
                    },
                    label: {
                        Text("Okay")
                    }
                )
            },
            message: {
                Text(viewModel.errorMessage ?? "Unexpected Error Occured")
            }
        )
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
    .environment(SettingUtils())
}
