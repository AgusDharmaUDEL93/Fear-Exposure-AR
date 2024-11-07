//
//  ProfileScreen.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 03/11/24.
//

import SwiftUI

struct ProfileScreen : View {
    
    @State var viewModel = ProfileViewModel()
    @AppStorage("locale") private var locale = Locale.current.identifier
    @Environment(Router.self) private var router

    
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
                        
                        TitleProfile(label: "Settings")
                        
                        ListTextProfile(
                            label: "Phobias",
                            image: "brain.filled.head.profile",
                            onAction: {
                                
                            }
                        )
                        ListTextProfile(
                            label: "Notification",
                            image: "bell",
                            onAction: {
                                
                            }
                        )
                        ListTextProfile(
                            label: "Language",
                            image: "globe",
                            onAction: {
                                viewModel.onOpenLanguageSheets()
                            },
                            isBottom: true,
                            selectedItem: viewModel.getLanguageSeletedLabel()
                        )
                        
                        TitleProfile(label: "Others")
                        ListTextProfile(
                            label: "Help Center",
                            image: "lifepreserver",
                            onAction: {
                                
                            }
                        )
                        
                        ListTextProfile(
                            label: "Terms & Conditions",
                            image: "doc.plaintext",
                            onAction: {
                                router.navigate(to: .termCondition)
                            }
                        )
                        ListTextProfile(
                            label: "Privacy Notice",
                            image: "lock.shield",
                            onAction: {
                                
                            }
                        )
                        ListTextProfile(
                            label: "About",
                            image: "info.circle",
                            onAction: {
                                
                            },
                            isBottom: true,
                            selectedItem: "Version 1.0.0 (Latest)"
                        )
                        Spacer()
                            .frame(height: 16)
                        
                        
                    }
                    .padding(.horizontal, 16)
                }
                .frame(maxWidth: geometry.size.width)
            }
            .sheet(
                isPresented: $viewModel.isSheetLanguageOpen,
                content: {
                    NavigationStack {
                        ModalLanguageProfile(languageSelected: viewModel.languageSelected, onTapList: { language in
                            viewModel.onChangedLanguage(language: language)
                            locale = language.rawValue
                            
                        })
                        
                    }
                }
            )
        }
        .onAppear{
            viewModel.languageSelected = Locale(identifier: locale)
        }
    }
}

#Preview {
    NavigationStack {
        ProfileScreen()
    }
    .environment(Router())
}
