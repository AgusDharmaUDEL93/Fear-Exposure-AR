//
//  ChipEmoji.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 15/10/24.
//

import SwiftUI

struct ChipEmoji : View {
    
    @Binding var isActive : Bool
    var action : () -> Void
    var emoji : Feeling
    
   
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            Text(emoji.getEmoji())
                .font(.system(size: 30))
                .padding(12)
                .background(isActive ? Color(Theme.primary500.rawValue) : Color(Theme.primary50.rawValue))
                .clipShape(.circle)
        })
        
    }
}

#Preview {
    ChipEmoji(
        isActive: .constant(false),
        action: {
            
        },
        emoji: .veryHappy
    )
}
