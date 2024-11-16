//
//  DisclaimerItem.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 16/11/24.
//

import SwiftUI

struct DisclaimerItem : View {
    
    let number: String
    let title: String
    let description: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .top) {
                Text(number)
                    .font(.body)
                    .fontWeight(.bold)
                VStack(alignment: .leading) {
                    Text(LocalizedStringKey(title))
                        .font(.body)
                        .fontWeight(.bold)
                    Text(LocalizedStringKey(description))
                        .font(.body)
                }
            }
        }
    }
}
