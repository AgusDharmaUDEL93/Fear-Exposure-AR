//
//  HomeScreen.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 14/10/24.
//

import SwiftUI

struct TherapyScreen : View {
    
    @Environment(Router.self) private var router
    
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
                    CardTherapy(
                        title: "Intense fear of Spiders",
                        caption: "Arachnophobia",
                        action: {
                            
                        }
                    )
                    CardTherapy(
                        title: "Intense fear of Spiders",
                        caption: "Arachnophobia",
                        isAnimal: false,
                        action: {
                            
                        }
                    )
                    
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
