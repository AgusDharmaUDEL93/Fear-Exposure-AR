//
//  CardTheraphyType.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 10/11/24.
//

import SwiftUI

struct CardTheraphyType : View {
    let title : String
    let description : String
    let image : String
    let isRecomended : Bool
    let action : () -> Void
    
    @Binding var isSelected : Bool
    
    var body: some View  {
        
        Button (action : action, label: {
            VStack {
                if (isRecomended){
                    HStack {
                        Text("Recommended")
                            .padding(.vertical, 4)
                            .padding(.horizontal, 8)
                            .background(Color(Theme.primary500.rawValue))
                            .font(.subheadline)
                            .foregroundStyle(Color(Theme.background.rawValue))
                            .clipShape(
                                .rect(
                                    topLeadingRadius: 0,
                                    bottomLeadingRadius: 0,
                                    bottomTrailingRadius: 8,
                                    topTrailingRadius: 0
                                )
                            )
                        Spacer()
                    }
                }
                Spacer()
                    .frame(height: 16)
                HStack {
                    VStack (alignment :.leading) {
                        Text (LocalizedStringKey(title))
                            .font(.body)
                            .bold()
                        Spacer()
                            .frame(height: 8)
                        Text(LocalizedStringKey(description))
                            .font(.subheadline)
                    }
                    Spacer()
                    Image(systemName: image)
                        .font(.largeTitle)
                        .foregroundStyle(Color(Theme.primary500.rawValue))
                }
                .padding(.horizontal, 16)
                    
                
                
            }
            .padding(.bottom, 16)
            .frame(maxWidth: .infinity)
            .background(isSelected ? Color(Theme.primary100.rawValue) : .clear)
            .clipShape(
                RoundedRectangle(cornerRadius: 8)
            )
            .background{
                RoundedRectangle(cornerRadius: 8)
                    .stroke(isSelected ? Color(Theme.primary500.rawValue) : .black.opacity(0.1), lineWidth: 1)
            }
        })
        .buttonStyle(.plain)
        
    }
    
}

#Preview {
    CardTheraphyType(title: "Pictures", description: "View photos of your feared object to gradually reduce your fear response.", image: "photo.fill", isRecomended: true, action: {
        
    }, isSelected: .constant(false))
    .padding()
}
