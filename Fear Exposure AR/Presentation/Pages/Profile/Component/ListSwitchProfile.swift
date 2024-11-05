//
//  ListSwitchProfile.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 04/11/24.
//

import SwiftUI

struct ListSwitchProfile : View {
    
    let label : String
    let image : String
    
    
    var body: some View {
        
        VStack {
            Spacer()
                .frame(height: 16)
            Toggle(
                isOn: .constant(true),
                label: {
                    HStack {
                        Image(systemName: "globe")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 25)
                        Spacer()
                            .frame(width: 16)
                        Text ("Dark Mode")
                        Spacer()
                        
                    }
                }
            )
            
            Spacer()
                .frame(height: 16)
            Divider()
        }
        
    }
}

#Preview {
    ListSwitchProfile(
        label: "Dark Mode", image: "globe"
    )
        .padding()
}
