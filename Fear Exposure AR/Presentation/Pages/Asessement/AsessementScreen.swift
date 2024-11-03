//
//  AsessementScreen.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 31/10/24.
//

import SwiftUI

struct AsessementScreen : View {
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack (alignment : .leading) {
                    Spacer()
                        .frame(width: 0, height: geometry.size.height * 0.15)
                        .frame(maxWidth: geometry.size.width)
                    Text ("Fear Asessement")
                        .font(.largeTitle)
                        .bold()
                    Text ("Please complete this assessment form to help us tailor the therapy to your specific needs.")
                        .font(.body)
                }
                
                .foregroundStyle(Color(Theme.background.rawValue))
                .padding(.horizontal, 16)
                .padding(.bottom, 16)
                .frame(maxWidth: geometry.size.width)
                .background(Color(Theme.primary500.rawValue))
                
                VStack (alignment : .leading) {
                    Spacer()
                        .frame(height: 32)
                        .frame(maxWidth: geometry.size.width)
                    
                    Text("Question Category")
                        .font(.title3)
                        .bold()
                    
                    QuestionAsessement(
                        number: 1,
                        question: "How intense is your fear when exposed to the object?",
                        options: [
                            "None", "Slightly", "Mild", "Terrified"
                        ],
                        onChangedSelectedOption: { data in
                            
                        }
                    )
                    
                }
                .padding(.horizontal, 16)
                .frame(maxWidth: geometry.size.width)
                
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    NavigationStack {
        AsessementScreen()
    }
    .accentColor(Color(Theme.primary500.rawValue))
    .environment(Router())
}
