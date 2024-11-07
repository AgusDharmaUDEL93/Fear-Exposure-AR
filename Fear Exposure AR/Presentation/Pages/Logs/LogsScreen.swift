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
            ScrollView {
                TitleScreen(
                    title: "Session Log",
                    description: "Description of this screen and its purpose."
                )
                VStack (alignment: .leading) {
                    Spacer()
                        .frame(maxWidth: geometry.size.width)
                    
                    TitleMonth(label: "October 2024")
                    
                    HStack {
                        VStack {
                            Text("SUN")
                                .font(.caption)
                                .bold()
                            Text("2")
                                .font(.title3)
                                .bold()
                        }
                        .frame(width: 52, height: 52)
                        .foregroundStyle(Color(Theme.primary500.rawValue))
                        .background(content: {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color(Theme.primary100.rawValue))
                        })
                        
                        
                    }
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 16)
            }
        }
    }
}

#Preview {
    NavigationStack {
        LogsScreen()
    }
    .tint(Color(Theme.primary500.rawValue))
    .environment(Router())
}
