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
                    TitleScreen(title: String(localized: "Settings"), description: "")
                    VStack (alignment : .leading) {
                        TitleSectionSetting(label: String(localized: "General"))
                        ListTextProfile(
                            label: String(localized: "Phobias"),
                            image: "brain.filled.head.profile",
                            onAction: {
                                router.navigate(to: .introductionPhobia)
                            }
                        )
                        ListTextProfile(
                            label: String(localized: "Language") ,
                            image: "globe",
                            onAction: {
                                viewModel.onOpenLanguageSheets()
                            },
                            isBottom: true,
                            selectedItem: viewModel.getLanguageSeletedLabel()
                        )
                        
                        TitleSectionSetting(label: "Others")
                        ListTextProfile(
                            label: String(localized: "Terms & Conditions"),
                            image: "doc.plaintext",
                            onAction: {
                                router.navigate(to: .termCondition(isOnlyShowing: true))
                            }
                        )
                        ListTextProfile(
                            label: String(localized: "Privacy Notice"),
                            image: "lock.shield",
                            onAction: {
                                router.navigate(to: .privacyNotice)
                            }
                        )
                        ListTextProfile(
                            label: String(localized: "About"),
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
            .sheet(
                isPresented: $viewModel.isSheetLanguageOpen,
                content: {
                    ModalLanguageProfile(languageSelected: viewModel.languageSelected, onTapList: { language in
                        viewModel.onChangedLanguage(language: language)
                        locale = language.rawValue
                        
                    })
                    
                    .presentationDetents([.height(270)])
                }
            )
        }
        .onAppear{
            
            if (locale != Language.english.rawValue && locale != Language.indonesia.rawValue){
                viewModel.languageSelected = Locale(identifier: Language.english.rawValue)
            } else {
                viewModel.languageSelected = Locale(identifier: locale)
            }
            
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
