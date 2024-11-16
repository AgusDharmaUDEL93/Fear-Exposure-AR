//
//  TitleSetting.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 30/10/24.
//

import SwiftUI

struct TitleSetting : View {
    
    let title : String
    
    var body: some View {
        Text (LocalizedStringKey(title))
            .font(.title3)
            .bold()
            .padding(.top, 32)
            .padding(.bottom, 16)
    }
}

#Preview {
    TitleSetting(title: "General")
}
