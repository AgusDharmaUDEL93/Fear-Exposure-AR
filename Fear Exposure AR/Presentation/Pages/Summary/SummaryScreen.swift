//
//  SummaryScreen.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 15/10/24.
//

import SwiftUI

struct SummaryScreen : View {
    
    @Environment(Router.self) var router
    
    var body : some View {
        GeometryReader { geometry in
            ScrollView {
                VStack (spacing: 32) {
                    Image("image/illustration/summary")
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    VStack (spacing: 8) {
                        Text("You’re Doing Great!")
                            .font(.title2)
                            .bold()
                        Text("Congratulations! You have completed your session!")
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    VStack (spacing : 16) {
                        HStack (spacing: 16) {
                            CardSummary(
                                title: "Avg. Heart Rate",
                                value: "87 BPM"
                            )
                            CardSummary(
                                title: "Avg. Heart Rate",
                                value: "87 BPM"
                            )
                        }
                        
                        CardSummary(
                            title: "Avg. Heart Rate",
                            value: "87 BPM"
                        )
                    }
                    VStack (spacing: 8) {
                        Button(
                            action: {
                                
                            },
                            label: {
                                Text("Continue to Next Session")
                                    .frame(maxWidth: geometry.size.width)
                                    .foregroundStyle(Color(Theme.background.rawValue))
                                    .padding(.vertical, 6)
                                    .bold()
                                
                            }
                        )
                        .buttonStyle(.borderedProminent)
                        .tint(Color(Theme.primary500.rawValue))
                        
                        Button(
                            action: {
                                router.navigateBack()
                            },
                            label: {
                                Text("Done")
                                    .frame(maxWidth: geometry.size.width)
                                    .foregroundStyle(Color(Theme.primary500.rawValue))
                                    .padding(.vertical, 6)
                                    .bold()
                                
                            }
                        )
                        .buttonStyle(.borderless)
                    }
                    
                    
                }
                .padding(.horizontal, 16)
            }
        }
        .padding(.top, 32)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    NavigationStack {
        SummaryScreen()
    }
    .environment(Router())
}
