//
//  ListModalLanguage.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 06/11/24.
//

import SwiftUI

struct ListModalLanguage : View {
    
    @Binding var isLanguageSelected : Bool
    let label : String
    let image : String
    var isBottom : Bool = false
    var onTapList : () -> Void
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 16)
            Button(
                action: {
                    onTapList()
                },
                label: {
                    HStack {
                        Image( image)
                        Spacer()
                            .frame(width: 16)
                        Text(label)
                            .font(.body)
                        Spacer()
                        if (isLanguageSelected){
                            Circle()
                                .fill(Color(Theme.primary500.rawValue))
                                .padding(4)
                                .overlay{
                                    Circle()
                                        .stroke(Color(Theme.primary500.rawValue), lineWidth: 1)
                                }
                                .frame(width: 20, height: 20)
                        } else {
                            Circle()
                                .fill(.clear)
                                .padding(4)
                                .overlay{
                                    Circle()
                                        .stroke(.gray, lineWidth: 1)
                                }
                                .frame(width: 20, height: 20)
                        }
                        
                    }
                    
                }
            )
            .buttonStyle(.plain)
            Spacer()
                .frame(height: 16)
            if (!isBottom){
                Divider()
            }
        }
        
        
    }
}

#Preview {
    ListModalLanguage(
        isLanguageSelected: .constant(true),
        label: "English (US)",
        image: "image/flag/english_flag",
        onTapList: {
            
        }
    )
    .padding()
}
