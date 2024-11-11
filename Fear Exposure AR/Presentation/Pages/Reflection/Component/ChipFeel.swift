//
//  ChipFeel.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 10/11/24.
//

import SwiftUI

struct ChipFeel : View {
    
    let label : String
    @Binding var isSelected : Bool
    var onSelected : () -> Void
    
    var body: some View {
        Button(
            action : onSelected,
            label: {
                Text(label)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 8)
                    .background(
                        isSelected ? Color(Theme.primary100.rawValue) : .clear
                    )
                    .clipShape( RoundedRectangle(cornerRadius: 10000))
                    .background{
                        RoundedRectangle(cornerRadius: 10000)
                            .stroke(isSelected ? Color(Theme.primary500.rawValue) : .black.opacity(0.1))
                    }
            }
        )
        .buttonStyle(.plain)
    }
}

#Preview {
    ChipFeel(
        label: "Neutral",
        isSelected: .constant(true),
        onSelected: {
            
        }
    )
}
