//
//  ListTextSetting.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 30/10/24.
//

import SwiftUI

struct ListTextSetting : View {
    
    let title : String
    let description : String
    let onClick : () -> Void
    
    var body: some View {
        Button (
            action : onClick,
            label : {
                VStack  {
                    Spacer()
                        .frame(height: 16)
                    HStack {
                        VStack (alignment : .leading) {
                            Text (LocalizedStringKey(title))
                                .font(.body)
                            Spacer()
                                .frame(height: 8)
                            Text (LocalizedStringKey(description))
                                .font(.caption)
                        }
                        Spacer()
                        Image (systemName: "chevron.right")
                    }
                    Spacer()
                        .frame(height: 16)
                    Divider()
                }
            }
        )
        .buttonStyle(.plain)
        
    }
}

#Preview {
    ListTextSetting(
        title: "Scale Object",
        description: "Resize feared object to make it bigger or smaller.",
        onClick: {
            
        }
    )
    .padding(.horizontal, 16)
}
