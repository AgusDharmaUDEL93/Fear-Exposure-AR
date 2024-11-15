//
//  FormAfterSession.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 10/11/24.
//

import SwiftUI
import WrappingHStack

struct FormAfterSession : View {
    
    @Binding var feelingAfterSelected : FeelingAfter
    
    var body: some View {
        WrappingHStack (alignment : .leading) {
            ChipFeel(
                label: FeelingAfter.terrified.getLabel(),
                isSelected: Binding(
                    get: {
                        feelingAfterSelected == FeelingAfter.terrified
                    },
                    set: { value in
                        
                    }
                ),
                onSelected: {
                    feelingAfterSelected = FeelingAfter.terrified
                }
            )
            ChipFeel(
                label: FeelingAfter.afraid.getLabel(),
                isSelected: Binding(
                    get: {
                        feelingAfterSelected == FeelingAfter.afraid
                    },
                    set: { value in
                        
                    }
                ),
                onSelected: {
                    feelingAfterSelected = FeelingAfter.afraid
                }
            )
            ChipFeel(
                label: FeelingAfter.relieved.getLabel(),
                isSelected: Binding(
                    get: {
                        feelingAfterSelected == FeelingAfter.relieved
                    },
                    set: { value in
                        
                    }
                ),
                onSelected: {
                    feelingAfterSelected = FeelingAfter.relieved
                }
            )
            
            ChipFeel(
                label: FeelingAfter.neutral.getLabel(),
                isSelected: Binding(
                    get: {
                        feelingAfterSelected == FeelingAfter.neutral
                    },
                    set: { value in
                        
                    }
                ),
                onSelected: {
                    feelingAfterSelected = FeelingAfter.neutral
                }
            )
            ChipFeel(
                label: FeelingAfter.better.getLabel(),
                isSelected: Binding(
                    get: {
                        feelingAfterSelected == FeelingAfter.better
                    },
                    set: { value in
                        
                    }
                ),
                onSelected: {
                    feelingAfterSelected = FeelingAfter.better
                }
            )
        }
    }
}

#Preview {
    FormAfterSession(
        feelingAfterSelected: .constant(.terrified)
    )
    .padding()
    .tint(Color(Theme.primary500.rawValue))
}
