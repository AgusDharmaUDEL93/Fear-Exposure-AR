//
//  CardEmoji.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 10/11/24.
//

import SwiftUI

struct CardEmoji : View {
    
    let emoji : String
    let label : String
    @Binding var isSelected : Bool
    var onSelected : () -> Void
    
    var body: some View {
        Button(action : onSelected, label: {
            VStack {
                Text(LocalizedStringKey(emoji))
                    .font(.system(size: 34))
                Text(LocalizedStringKey(label))
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background( isSelected ? Color(Theme.primary100.rawValue) : .clear)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(isSelected ? Color(Theme.primary500.rawValue) : .black.opacity(0.1), lineWidth: 1)
            )
        })
        .buttonStyle(.plain)
        
    }
}

#Preview {
    LazyVGrid (columns: [
        GridItem(.adaptive(minimum: 100)),
        GridItem(.adaptive(minimum: 100))
    ]){
        CardEmoji(emoji: "😰", label: "Terrified", isSelected: .constant(true), onSelected: {
            
        })
    }
    .padding()
}
