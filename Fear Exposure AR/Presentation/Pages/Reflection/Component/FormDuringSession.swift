//
//  FormDuringSession.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 10/11/24.
//

import SwiftUI

struct FormDuringSession : View {
    
    @Binding var valueSelected : Feeling
    
    var body: some View {
        LazyVGrid (columns: [
            GridItem(.adaptive(minimum: 100)),
            GridItem(.adaptive(minimum: 100))
        ]) {
            CardEmoji(
                emoji: Feeling.terrified.getEmoji(),
                label: Feeling.terrified.getLabel(),
                isSelected: Binding(get: {
                    valueSelected == Feeling.terrified
                }, set: { value in
                    
                }),
                onSelected: {
                    valueSelected = Feeling.terrified
                }
            )
            CardEmoji(
                emoji: Feeling.frightened.getEmoji(),
                label: Feeling.frightened.getLabel(),
                isSelected: Binding(get: {
                    valueSelected == Feeling.frightened
                }, set: { value in
                    
                }),
                onSelected: {
                    valueSelected = Feeling.frightened
                }
            )
            CardEmoji(
                emoji: Feeling.scared.getEmoji(),
                label: Feeling.scared.getLabel(),
                isSelected: Binding(get: {
                    valueSelected == Feeling.scared
                }, set: { value in
                    
                }),
                onSelected: {
                    valueSelected = Feeling.scared
                }
            )
            CardEmoji(
                emoji: Feeling.neutral.getEmoji(),
                label: Feeling.neutral.getLabel(),
                isSelected: Binding(get: {
                    valueSelected == Feeling.neutral
                }, set: { value in
                    
                }),
                onSelected: {
                    valueSelected = Feeling.neutral
                }
            )
            
        }
    }
}


#Preview {
    FormDuringSession(
        valueSelected: .constant(.neutral)
    )
    .padding()
}

