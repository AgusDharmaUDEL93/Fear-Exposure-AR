//
//  AnswerAsessement.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 01/11/24.
//

import SwiftUI

struct AnswerAsessement : View {
    
    let label : String
    @Binding var isSelected : Bool
    let onTapAnswer : () -> Void
    
    var body: some View {
        Group {
            if (isSelected){
                Text(
                    label
                )
                .foregroundColor(.black)
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity)
                .background(Color(Theme.primary100.rawValue))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color(Theme.primary500.rawValue), lineWidth: 2)
                )
            } else {
                Text(
                    label
                )
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity)
                .clipShape(
                    RoundedRectangle(cornerRadius: 8)
                )
                .overlay{
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.fill, lineWidth: 1)
                }
            }
        }
        .onTapGesture {
            onTapAnswer()
        }
        
    }
}

#Preview {
    AnswerAsessement(
        label : "Yes",
        isSelected: .constant(true),
        onTapAnswer: {
            
        }
    )
    .padding()
}
