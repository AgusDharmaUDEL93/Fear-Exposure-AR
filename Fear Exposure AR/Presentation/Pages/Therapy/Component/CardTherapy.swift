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
    var isAnimal : Bool = true
    let action : () -> Void
    
    var body: some View {
        Button(
            action: action,
            label: {
                ZStack (alignment: .bottomLeading) {
                    Image(isAnimal ? "image/illustration/fear_animal" : "image/illustration/fear_object")
                        .offset(
                            x: -15,
                            y: 15
                        )
                    
                    VStack (alignment : .leading, spacing: 8) {
                        Text(caption)
                            .font(.subheadline)
                            .italic()
                        Text(title)
                            .font(.headline)
                            .bold()
                        Spacer()
                            .frame(height: 28)
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
            title: "Intense fear of Spiders",
            caption: "Arachnophobia",
            action: {
                
            }
        )
        
    }
    
    .padding(16)
}
