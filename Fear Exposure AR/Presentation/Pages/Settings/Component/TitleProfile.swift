//
//  TitleProfile.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 04/11/24.
//

import SwiftUI

struct TitleProfile : View {
    
    let label : String
    
    var body: some View {
        Text(label)
            .font(.title3)
            .bold()
            .padding(.top, 32)
            .padding(.bottom, 16)
    }
}
