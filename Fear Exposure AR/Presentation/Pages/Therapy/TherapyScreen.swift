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
        ScrollView {
            VStack (alignment:.leading) {
                Text("Today’s Session")
                    .font(.title2)
                
                CardTherapy(
                    title: "Afraid of Snakes?",
                    description: Text("Your daily \(Text("ophidiophobia").bold()) therapy session is ready"),
                    image: "image/illustration/card_snake",
                    beginRangeTime: 15,
                    endedRangeTime: 30,
                    action: {
                        router.navigate(to: .theraphyType)
                    }
                )
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 16)
        }
        .navigationTitle("Today")
    }
}

#Preview {
    NavigationStack {
        TherapyScreen()
    }
    .environment(Router())
    
}
