//
//  HomeScreen.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 14/10/24.
//

import SwiftUI

struct TherapyScreen : View {
    
    @Environment(Router.self) private var router
    @State var viewModel = TherapyViewModel()
    
    var body : some View {
        GeometryReader { geometry in
            ScrollView {
                TitleScreen(
                    title: "Therapies",
                    description: "Description of this screen and its purpose."
                )
                LazyVGrid (columns: [
                    GridItem(.adaptive(minimum: 100)),
                    GridItem(.adaptive(minimum: 100))
                ], spacing: 16){
                    ForEach(viewModel.phobia, id: \.id){ phobia in
                        CardTherapy(
                            title: phobia.description,
                            caption: phobia.name,
                            action: {
                                
                            }
                        )
                    }
                }
                .padding(.horizontal, 16)
            }
        }
    }
}

#Preview {
    NavigationStack {
        TherapyScreen()
    }
    .environment(Router())
    
}
