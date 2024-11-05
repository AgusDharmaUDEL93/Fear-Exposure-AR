//
//  ProfileScreen.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 03/11/24.
//

import SwiftUI

struct ProfileScreen : View {
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack (alignment : .leading) {
                    ZStack (alignment : .topLeading) {
                        Color(Theme.primary500.rawValue)
                            .frame(height: 250)
                        Text("Profile")
                            .font(.largeTitle)
                            .bold()
                            .padding(.top, 48)
                            .padding(.horizontal, 16)
                            .foregroundStyle(Color(Theme.background.rawValue))
                        
                        VStack {
                            Spacer()
                            Image("image/data/sad_hamster")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150)
                                .clipShape(Circle())
                                .overlay(content: {
                                    Circle()
                                        .stroke(.white, lineWidth: 3)
                                })
                            
                            Spacer()
                                .frame(height: 16)
                            Text("Putu Wira")
                                .font(.title3)
                                .bold()
                        }
                        .frame(height: 375)
                        .frame(maxWidth: geometry.size.width)
                    }
                    VStack (alignment : .leading) {
                        
                        TitleProfile(label: "General")
                        
                        ListTextProfile(
                            label: "Phobia",
                            image: "globe",
                            onAction: {
                                
                            }
                        )
                        ListTextProfile(
                            label: "Phobia",
                            image: "globe",
                            onAction: {
                                
                            }
                        )
                        ListTextProfile(
                            label: "Phobia",
                            image: "globe",
                            onAction: {
                                
                            }
                        )
                        TitleProfile(label: "App Settings")
                        ListTextProfile(
                            label: "Phobia",
                            image: "globe",
                            onAction: {
                                
                            }
                        )
                        ListSwitchProfile(label: "Dark Mode", image: "globe")
                        
                        TitleProfile(label: "Support")
                        ListTextProfile(
                            label: "Phobia",
                            image: "globe",
                            onAction: {
                                
                            }
                        )
                        ListTextProfile(
                            label: "Phobia",
                            image: "globe",
                            onAction: {
                                
                            }
                        )
                        ListTextProfile(
                            label: "Phobia",
                            image: "globe",
                            onAction: {
                                
                            }
                        )
                        Spacer()
                            .frame(height: 16)
                        
                        
                    }
                    .padding(.horizontal, 16)
                }
                .frame(maxWidth: geometry.size.width)
            }
        }
    }
}

#Preview {
    ProfileScreen()
}
