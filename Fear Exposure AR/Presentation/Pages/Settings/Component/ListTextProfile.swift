//
//  ListProfileSettings.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 04/11/24.
//

import SwiftUI

struct ListTextProfile : View {
    let label : String
    let image : String
    let onAction : () -> Void
    var isBottom : Bool = false
    var selectedItem : String = ""
    
    var body: some View {
        Button(
            action : onAction,
            label : {
                VStack {
                    Spacer()
                        .frame(height: 16)
                    HStack {
                        Image(systemName: image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 25)
                        Spacer()
                            .frame(width: 16)
                        Text (label)
                        Spacer()
                        
                        // TODO : Changed the color
                        Text(selectedItem)
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                        
                        Image (systemName: "chevron.right")
                    }
                    Spacer()
                        .frame(height: 16)
        
                    
                    
                    if (!isBottom){
                        Divider()
                    }
                }
            }
        )
        .buttonStyle(.plain)
    }
}

#Preview {
    ListTextProfile(
        label: "Phobia",
        image: "globe",
        onAction: {
            
        },
        isBottom: false,
        selectedItem: "English (US)"
    )
        .padding()
}
