//
//  CardTherapy.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 14/10/24.
//

import SwiftUI


struct CardTherapy : View {
    
    let title : String
    let caption : String
    let image : String
    let action : () -> Void
    
    var body: some View {
        Button(
            action: action,
            label: {
                ZStack (alignment: .bottomLeading) {
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 100, maxHeight: 100)
                        .offset(
                            x: -15,
                            y: 15
                        )
                    
                    VStack (alignment : .leading, spacing: 8) {
                        Text(LocalizedStringKey(caption))
                            .font(.subheadline)
                            .italic()
                        Text(LocalizedStringKey(title))
                            .font(.headline)
                            .bold()
                            .lineLimit(3, reservesSpace: true)
                            
                        Spacer()
                            .frame(maxWidth: .infinity)
                        
                        HStack {
                            Spacer()
                            Image(systemName: "arrow.right.circle.fill")
                                .font(.largeTitle)
                                .foregroundStyle(Color(Theme.primary500.rawValue))
                        }
                        
                    }
                    .padding(16)
                    .frame(maxWidth: .infinity)
                    
                    
                }
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .overlay{
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.fill, lineWidth: 1)
                }
            }
        )
        .buttonStyle(.plain)
        
        
    }
}

#Preview {
    LazyVGrid (columns: [
        GridItem(.adaptive(minimum: 100)),
        GridItem(.adaptive(minimum: 100))
    ]){
        CardTherapy(
            title: "Ketakutan besar terhadap Laba-laba",
            caption: "Arachnophobia",
            image: "image/illustration/phobia/balloon",
            action: {
                
            }
        )
        CardTherapy(
            title: "Intense fear of Spiders",
            caption: "Arachnophobia",
            image: "image/illustration/phobia/balloon",
            action: {
                
            }
        )
    }
    
    .padding(16)
}
