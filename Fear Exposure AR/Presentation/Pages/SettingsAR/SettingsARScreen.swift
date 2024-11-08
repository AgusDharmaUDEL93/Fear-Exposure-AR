//
//  SettingsARScreen.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 30/10/24.
//

import SwiftUI

struct SettingsARScreen : View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ScrollView {
                    VStack (alignment : .leading) {
                        
                        TitleSetting(title: "General")
                        ListTextSetting(
                            title: "Scale Object",
                            description: "Resize feared object to make it bigger or smaller."
                        )
                        ListTextSetting(
                            title: "Rotate Object",
                            description: "Adjust the feared object to face any direction you prefer."
                        )
                        ListSliderSetting(
                            title: "Feared Object Volume",
                            description: "Adjust volume of sounds produced by the feared object."
                        )
                        
                        ListToggleSetting(
                            title: "Snake Animation",
                            description: "Description"
                        )
                        Spacer()
                            .frame(height: 40)
                    }
                    .padding(.horizontal, 16)

                    
                }
                VStack {
                    Spacer()
                    Button(action: {
                        
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
    }
}

#Preview {
    NavigationStack {
        SettingsARScreen()
    }
    .tint(Color(Theme.primary500.rawValue))
    .environment(Router())
}
