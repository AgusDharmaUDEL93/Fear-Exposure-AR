//
//  TherapyTypeScreen.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 14/10/24.
//

import SwiftUI

struct TherapyTypeScreen : View {
    
    @Environment(Router.self) private var router
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack (alignment:.leading, spacing: 16) {
                    CardTypeOld(
                        title: "Pictures",
                        description: "View photos of your feared object to gradually reduce your fear response.",
                        image: "photo",
                        action: {
                            router.navigate(to: .picturePlayground)
                        }
                    )

                    CardTypeOld(
                        title: "AR",
                        description: "Use AR to see and interact with snakes in a more realistic environment.",
                        image: "arkit",
                        action: {
                            router.navigate(to: .arPlayground)
                        }
                    )
                    
                }
                .frame(maxWidth: geometry.size.width, alignment: .leading)
                .padding(.horizontal, 16)
            }
        }
        .navigationTitle("Select Therapy")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        TherapyTypeScreen()
    }
    .environment(Router())
}
