//
//  CardTherapyType.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 15/10/24.
//

import SwiftUI

struct CardTherapyType : View {
    
    let title : String
    let description : String
    let image : String
    let action : () -> Void
    
    var body : some View {
        Button(action: {
            action()
        }, label: {
            HStack {
                VStack (alignment: .leading) {
                    Text(title)
                        .font(.title3)
                        .bold()
                    Text(description)
                        .font(.body)
                }
                Spacer()
                    .frame(width: 70)
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 40)
                    .foregroundStyle(Color(Theme.primary500.rawValue))
            }
            .frame(maxWidth: .infinity)
            .padding(16)
            .background(Color(Theme.primary50.rawValue))
            .clipShape(RoundedRectangle(cornerRadius: 8))
        })
        .buttonStyle(.plain)
        
    }
}

#Preview {
    CardTherapyType(
        title: "Pictures", description: "View photos of your feared object to gradually reduce your fear response.", image: "photo",
        action: {
            
        }
    )
        .padding(16)
}
