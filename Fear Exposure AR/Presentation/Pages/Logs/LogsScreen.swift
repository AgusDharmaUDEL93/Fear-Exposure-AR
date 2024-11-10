//
//  LogsScreen.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 05/11/24.
//

import SwiftUI

struct LogsScreen : View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                TitleScreen(
                    title: "Session Log",
                    description: "Description of this screen and its purpose."
                )
                ScrollView {
                    
                    VStack (alignment: .leading) {
                        Spacer()
                            .frame(maxWidth: geometry.size.width)
                        
                        CardLog()
                        
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 16)
                    Spacer()
                        .frame(height: 110)
                }
            }
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationStack {
        LogsScreen()
    }
    .tint(Color(Theme.primary500.rawValue))
    .environment(Router())
}
