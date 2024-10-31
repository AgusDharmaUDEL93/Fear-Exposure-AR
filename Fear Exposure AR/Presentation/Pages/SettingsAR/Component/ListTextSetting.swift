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
    
    var body: some View {
        Button (
            action : {
                
            },
            label : {
                VStack  {
                    Spacer()
                        .frame(height: 16)
                    HStack {
                        VStack (alignment : .leading) {
                            Text (title)
                                .font(.body)
                            Spacer()
                                .frame(height: 8)
                            Text (description)
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
        description: "Resize feared object to make it bigger or smaller."
    )
    .padding(.horizontal, 16)
}
