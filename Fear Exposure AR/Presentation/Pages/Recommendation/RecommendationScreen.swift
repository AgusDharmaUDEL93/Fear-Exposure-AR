//
//  RecommendationScreen.swift
//  Fear Exposure AR
//
//  Created by Steven Ongkowidjojo on 09/11/24.
//

import SwiftUI

struct RecommendationScreen: View {
    let recommendation: String
    var body: some View {
        VStack {
            Text("Your Recommended Exposure Method")
                .font(.largeTitle)
                .padding()
            
            Text(recommendation)
                .font(.title)
                .bold()
                .padding()
        }
        .navigationTitle("Recommendation")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    RecommendationScreen(recommendation: "None")
}
