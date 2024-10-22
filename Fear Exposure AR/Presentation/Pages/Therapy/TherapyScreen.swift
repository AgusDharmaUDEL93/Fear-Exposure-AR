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
                            router.navigate(to: .userInfo)
                        }
                    )
                    
                }
                .frame(maxWidth: geometry.size.width, alignment: .leading)
                .padding(.horizontal, 16)
            }
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
