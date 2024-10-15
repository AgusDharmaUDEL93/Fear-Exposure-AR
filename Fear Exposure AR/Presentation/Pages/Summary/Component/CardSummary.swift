//
//  CardSummary.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 15/10/24.
//

import SwiftUI

struct CardSummary : View {
    
    let title : String
    let value : String
    
    var body: some View {
        VStack (spacing: 8) {
            Image(systemName: "star.fill")
                .foregroundStyle(Color(Theme.primary500.rawValue))
                .font(.body)
                .padding(8)
                .background(Color(Theme.primary50.rawValue))
                .clipShape(.circle)
            Text(title)
                .font(.subheadline)
            Text(value)
                .font(.title3)
                .bold()
            
        }
        .padding(16)
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

#Preview {
    CardSummary(
        title: "Avg. Heart Rate",
        value: "87 BPM"
    )
        .padding(.horizontal, 16)
}
