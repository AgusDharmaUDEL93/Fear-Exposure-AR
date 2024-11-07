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
                        title: "Intense fear of Snake",
                        caption: "Arachnophobia",
                        action: {
                            
                        }
                    )
                    CardTherapy(
                        title: "Intense fear of Dog",
                        caption: "Cynophobia",
                        action: {
                            
                        }
                    )
                    CardTherapy(
                        title: "Intense fear of Crocodile",
                        caption: "Herpetophobia",
                        action: {
                            
                        }
                    )
                    CardTherapy(
                        title: "Intense fear of Cockroach",
                        caption: "Katsaridaphobia",
                        action: {
                            
                        }
                    )
                    CardTherapy(
                        title: "Intense fear of Lizard",
                        caption: "Herpetophobia",
                        action: {
                            
                        }
                    )
                    CardTherapy(
                        title: "Intense fear of Spider",
                        caption: "Arachnophobia",
                        action: {
                            
                        }
                    )
                    CardTherapy(
                        title: "Intense fear of Balloons",
                        caption: "Globophobia",
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
