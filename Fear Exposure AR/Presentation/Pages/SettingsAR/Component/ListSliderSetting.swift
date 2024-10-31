//
//  ListSliderSetting.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 30/10/24.
//

import SwiftUI

struct ListSliderSetting : View {
    
    let title : String
    let description : String
    
    var body: some View {
        VStack ( alignment : .leading) {
            Spacer()
                .frame(height: 16)
            Text (title)
                .font(.body)
            Spacer()
                .frame(height: 8)
            Text(description)
                .font(.caption)
            Spacer()
                .frame(height: 8)
            HStack {
                Image(systemName: "speaker.fill")
                Slider(value: .constant(0.5))
                    
                Image(systemName: "speaker.wave.3.fill")
            }
            Spacer()
                .frame(height: 16)
            Divider()
        }
    }
}

#Preview {
    ListSliderSetting(
        title: "Feared Object Volume", description: "Adjust volume of sounds produced by the feared object."
    )
        .padding(16)
}
