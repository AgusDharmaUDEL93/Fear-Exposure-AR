//
//  ProfileScreen.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 03/11/24.
//

import SwiftUI

struct SettingsScreen : View {
    
    @State var viewModel = SettingsViewModel()
    @AppStorage("locale") private var locale = Locale.current.identifier
    @Environment(Router.self) private var router

    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack (alignment : .leading) {
                    ZStack (alignment : .topLeading) {
                        Color(Theme.primary500.rawValue)
                            .frame(height: 250)
                        VStack {
                            Spacer()
                                .frame(height: 50)
                            Text("Settings")
                                .font(.largeTitle)
                                .bold()
                                .padding(.top, 48)
                                .padding(.horizontal, 16)
                                .foregroundStyle(Color(Theme.background.rawValue))
                        }
                    }
                    
                    VStack (alignment : .leading) {
                        TitleProfile(label: "General")
                        ListTextProfile(
                            label: "Phobias",
                            image: "brain.filled.head.profile",
                            onAction: {
                                router.navigate(to: .introductionPhobia)
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
                            label: "Terms & Conditions",
                            image: "doc.plaintext",
                            onAction: {
                                router.navigate(to: .termCondition(isOnlyShowing: true))
                            }
                        )
                        ListTextProfile(
                            label: "Privacy Notice",
                            image: "lock.shield",
                            onAction: {
                                router.navigate(to: .privacyNotice)
                            }
                        )
                        ListTextProfile(
                            label: "About",
                            image: "info.circle",
                            onAction: {
                                router.navigate(to: .about)
                            },
                            isBottom: true,
                            selectedItem: "Version 1.0.0 (Latest)"
                        )
                        Spacer()
                            .frame(height: 110)
                    }
                    .padding(.horizontal, 16)
                }
                .background(Color(Theme.background.rawValue))
                .frame(maxWidth: geometry.size.width)
            }
            .background(Color(Theme.primary500.rawValue))
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
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationStack {
        SettingsScreen()
    }
    .environment(Router())
}
