//
//  TitleScreenComponent.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 05/11/24.
//

import SwiftUI

struct TitleScreen : View {
    
    let title : String
    let description : String
    let isIgnoreSafeArea : Bool = true
    
    var body: some View {
        VStack (alignment : .leading) {
            Spacer()
                .frame(width: 0, height: isIgnoreSafeArea ? 120 : 80)
                .frame(maxWidth: .infinity)
            Text (LocalizedStringKey(title))
                .font(.largeTitle)
                .bold()
                .padding(.bottom, 4)
            if (!description.isEmpty){
                Text (LocalizedStringKey(description))
                    .font(.body)
            }
           
        }
        
        .foregroundStyle(Color(Theme.background.rawValue))
        .padding(.horizontal, 16)
        .padding(.bottom, 16)
        .frame(maxWidth: .infinity)
        .background(Color(Theme.primary500.rawValue))
    }
}


#Preview {
    TitleScreen(
        title: "Fear Asessement",
        description: "Please complete this assessment form to help us tailor the therapy to your specific needs."
    )
}
