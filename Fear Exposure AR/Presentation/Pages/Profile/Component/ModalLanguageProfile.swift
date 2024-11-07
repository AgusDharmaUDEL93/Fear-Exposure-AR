//
//  ModalLanguageProfile.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 06/11/24.
//

import SwiftUI

struct ModalLanguageProfile : View {
    
    var languageSelected : Locale
    var onTapList : (Language) -> Void
    
    var body: some View {
        VStack (alignment : .leading) {
            HStack {
                Spacer()
                RoundedRectangle(cornerRadius: 10000)
                    .fill(.fill)
                    .frame(width:  32, height: 4)
                Spacer()
            }
            
            Spacer()
                .frame(height: 24)
            
            Text("Languange")
                .font(.title2)
                .bold()
            Spacer()
                .frame(height: 24)
            ListModalLanguage(
                isLanguageSelected: Binding(get: {
                    languageSelected.identifier == Language.english.rawValue
                }, set: { value in
                    
                }),
                label: "English (US)",
                image: "image/flag/english_flag",
                onTapList: {
                    onTapList(.english)
                }
            )
            ListModalLanguage(
                isLanguageSelected: Binding(get: {
                    languageSelected.identifier == Language.indonesia.rawValue
                }, set: { value in
                    
                }),
                label: "Indonesia",
                image: "image/flag/indonesia_flag",
                onTapList: {
                    onTapList(.indonesia)
                }
            )
            
            Spacer()
              .border(Color.gray)
              .navigationBarTitle("", displayMode: .inline)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.vertical, 24)
        .presentationDetents([.height(270)])
    }
}
