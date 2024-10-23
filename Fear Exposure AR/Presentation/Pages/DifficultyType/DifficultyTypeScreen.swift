//
//  DifficultyTypeScreen.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 21/10/24.
//

import SwiftUI

struct DifficultyTypeScreen : View {
    
    @Environment(Router.self) private var router
    
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack (alignment:.leading, spacing: 16) {
                    Button(action: {
                        router.navigate(to: .arPlayground)
                    }, label: {
                        HStack {
                            VStack (alignment: .leading) {
                                Text("Easy")
                                    .font(.title3)
                                    .bold()
                            }
                            Spacer()
                            Image(systemName: "chevron.right")
                            
                        }
                        .frame(maxWidth: .infinity)
                        .padding(16)
                        .background(.green)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    })
                    .buttonStyle(.plain)
                    
                    Button(action: {
                        router.navigate(to: .arPlayground)

                    }, label: {
                        HStack {
                            VStack (alignment: .leading) {
                                Text("Medium")
                                    .font(.title3)
                                    .bold()
                            }
                            Spacer()
                            Image(systemName: "chevron.right")
                            
                        }
                        .frame(maxWidth: .infinity)
                        .padding(16)
                        .background(.yellow)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    })
                    .buttonStyle(.plain)
                    Button(action: {
                        router.navigate(to: .arPlayground)
                    }, label: {
                        HStack {
                            VStack (alignment: .leading) {
                                Text("Hard")
                                    .font(.title3)
                                    .bold()
                            }
                            Spacer()
                            Image(systemName: "chevron.right")
                            
                        }
                        .frame(maxWidth: .infinity)
                        .padding(16)
                        .background(.red)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    })
                    .buttonStyle(.plain)
                    
                }
                .frame(maxWidth: geometry.size.width, alignment: .leading)
                .padding(.horizontal, 16)
            }
        }
        .navigationTitle("Select Difficulty")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        DifficultyTypeScreen()
    }
    .environment(Router())
}
