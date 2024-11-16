//
//  ListToggleSetting.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 30/10/24.
//

import SwiftUI

struct ListToggleSetting : View {
    
    let title : String
    let description : String
    @Binding var isOn : Bool
    
    var body: some View {
        VStack  {
            Spacer()
                .frame(height: 16)
            HStack {
                Toggle(
                    isOn: $isOn,
                    label:  {
                        VStack (alignment : .leading) {
                            Text (LocalizedStringKey(title))
                                .font(.body)
                            Spacer()
                                .frame(height: 8)
                            Text (LocalizedStringKey(description))
                                .font(.caption)
                        }
                    }
                )
            }
            Spacer()
                .frame(height: 16)
            Divider()
        }
    }
}

#Preview {
    ListToggleSetting(title: "Snake Animation", description: "Description", isOn: .constant(true))
        .padding(16)
}
