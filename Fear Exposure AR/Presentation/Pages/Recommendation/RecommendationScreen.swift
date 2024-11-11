//
//  RecommendationScreen.swift
//  Fear Exposure AR
//
//  Created by Steven Ongkowidjojo on 09/11/24.
//

import SwiftUI

struct RecommendationScreen: View {
    
    @Environment(Router.self) var router
    @Environment(SettingUtils.self) var settings
    @State var viewModel : RecommendationViewModel = RecommendationViewModel()
    
    var body: some View {
        GeometryReader{ geometry in
            VStack {
                TitleScreen(title: "Result", description: "Based on the results of your assessment, you are recommended to proceed to therapy using:")
                ZStack (alignment : .bottom) {
                    ScrollView {
                        VStack {

                            CardTheraphyType(
                                title: "Pictures",
                                description: "View photos of your feared object to gradually reduce your fear response.",
                                image: "photo.fill",
                                isRecomended: viewModel.isPictureRecomended,
                                action: {
                                    viewModel.onSelectedPicture()
                                },
                                isSelected: $viewModel.isPictureSelected)
                            Spacer()
                                .frame(height: 16)
                            CardTheraphyType(
                                title: "AR",
                                description: "Use AR to see and interact with snakes in a more realistic environment.",
                                image: "arkit",
                                isRecomended: viewModel.isARRecomended,
                                action: {
                                    viewModel.onSelectedAR()
                                },
                                isSelected: $viewModel.isARSelected
                            )
                        }
                        .padding()
                    }
                    VStack {
                        Divider()
                        Spacer()
                            .frame(height: 16)
                        VStack {
                            Button(action: {
                                if (viewModel.isPictureSelected){
                                    router.navigate(to: .picturePlayground)
                                } else {
                                    router.navigate(to: .arPlayground)
                                }
                            }, label: {
                                Text ("Choose Therapy")
                                    .font(.body)
                                    .bold()
                                    .frame(maxWidth: geometry.size.width)
                                    .padding(.vertical, 6)
                            })
                            .buttonStyle(.borderedProminent)
                            .background(Color(Theme.background.rawValue))
                            .frame(maxWidth: .infinity)
                            .disabled(!viewModel.isPictureSelected && !viewModel.isARSelected)
                            Spacer()
                                .frame(height: 16)
                            Button(action: {
                                router.navigate(to: .assessment)
                            }, label: {
                                Text ("Retake Assessment")
                                    .font(.body)
                                    .bold()
                                    .frame(maxWidth: geometry.size.width)
                                    .padding(.vertical, 6)
                            })
                            .buttonStyle(.borderless)
                            .background(Color(Theme.background.rawValue))
                            .frame(maxWidth: .infinity)
                        }
                        .padding(.horizontal, 16)
                        
                    }
                    .padding(.bottom, 36)
                }
                
            }
        }
        .onAppear{
            viewModel.getAssessmentData(id: settings.phobiaId)
            if let result = viewModel.assessmentResult {
                settings.isObjectFollowUser = result.isObjectFollowUser
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
        RecommendationScreen()
    }
    .environment(Router())
    .environment(SettingUtils())
    .tint(Color(Theme.primary500.rawValue))
}
