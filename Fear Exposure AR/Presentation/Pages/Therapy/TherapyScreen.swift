//
//  HomeScreen.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 14/10/24.
//

import SwiftUI

struct TherapyScreen : View {
    
    @Environment(Router.self) private var router
    @Environment(SettingUtils.self) private var settingUtils
    @State var viewModel = TherapyViewModel()
    
    var body : some View {
        GeometryReader { geometry in
            VStack {
                TitleScreen(
                    title: "Therapies",
                    description: "Description of this screen and its purpose."
                )
                ScrollView {
                    
                    Spacer()
                        .frame(height: 16)
                    LazyVGrid (columns: [
                        GridItem(.adaptive(minimum: 100)),
                        GridItem(.adaptive(minimum: 100))
                    ], spacing: 16){
                        ForEach(viewModel.phobia, id: \.id){ phobia in
                            CardTherapy(
                                title: phobia.description,
                                caption: phobia.name,
                                isAnimal: phobia.isAnimal,
                                action: {
                                    if ( viewModel.getAssessmentStatus(phobiaId: phobia.id) == nil){
                                        router.navigate(to: .assessment)
                                    } else {
                                        router.navigate(to: .theraphyType)
                                    }
                                    
                                    settingUtils.phobiaId = phobia.id
                                   
                                    
                                }
                            )
                        }
                    }
                    .padding(.horizontal, 16)
                    Spacer()
                        .frame(height: 110)
                }
            }
            
        }
        .onAppear{
            viewModel.getSelectedPhobia()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationStack {
        TherapyScreen()
    }
    .environment(Router())
    .environment(SettingUtils())
    
}
