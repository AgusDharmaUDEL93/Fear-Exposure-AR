//
//  SettingsARScreen.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 30/10/24.
//

import SwiftUI

struct SettingsARScreen : View {
    
    @State var viewModel : SettingsARViewModel = SettingsARViewModel()
    @Environment(SettingUtils.self) private var settingUtils
    @Binding var isScaleObject : Bool
    @Binding var isOpenModalSheets : Bool
    var onScaleObject : () -> Void
    var onToggleButton : (Bool) -> Void
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ScrollView {
                    VStack (alignment : .leading) {
                        TitleSetting(title:  "General")
                        ListTextSetting(
                            title:  "Scale Object",
                            description:  "Resize feared object to make it bigger or smaller.",
                            onClick: onScaleObject
                        )
                       
                        ListSliderSetting(
                            title:  "Feared Object Volume",
                            description: "Adjust volume of sounds produced by the feared object.",
                            sliderValue: $viewModel.volume
                        )
                        
                        ListToggleSetting(
                            title:  "Object Follow User",
                            description:  "Feared Object maintains distance with the user as they move",
                            isOn: $viewModel.isObjectFollow
                        )
                        Spacer()
                            .frame(height: 150)
                    }
                    .padding(.horizontal, 16)

                    
                }
                VStack {
                    Spacer()
                    Button(action: {
                        settingUtils.isObjectFollowUser = viewModel.isObjectFollow
                        settingUtils.volume = viewModel.volume
                        print(settingUtils.volume)
                        onToggleButton(settingUtils.isObjectFollowUser)
                        viewModel.updateAssessmentStatus(id: settingUtils.phobiaId, isObjectFollow: settingUtils.isObjectFollowUser, volume:  settingUtils.volume)
                        
                        isOpenModalSheets = false
                        
                    }, label: {
                        Text ("Apply Changes")
                            .font(.body)
                            .bold()
                            .frame(maxWidth: geometry.size.width)
                            .padding(.vertical, 6)
                    })
                    .buttonStyle(.borderedProminent)
                    .padding(.horizontal)
                    .padding(.top)
                    .padding(.bottom, 48)
                    .background(Color(Theme.background.rawValue))
                    .frame(maxWidth: .infinity)
                }
                .ignoresSafeArea()
    
            }
        }
        .navigationTitle("Session Settings")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear{
            viewModel.getAssessmentStatus(id: settingUtils.phobiaId)
        }
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
        
    }
}

#Preview {
    NavigationStack {
        SettingsARScreen(
            isScaleObject: .constant(true),
            isOpenModalSheets: .constant(true),
            onScaleObject: {
                
            },
            onToggleButton: {value in
                
            }
        )
    }
    .tint(Color(Theme.primary500.rawValue))
    .environment(Router())
    .environment(SettingUtils())
}
