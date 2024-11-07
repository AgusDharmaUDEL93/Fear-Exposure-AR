//
//  TitleMonth.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 06/11/24.
//

import SwiftUI

struct TitleMonth : View {
    
    let label : String
    
    var body: some View {
        Text(label)
            .font(.title3)
            .bold()
            .padding(.vertical, 32)
    }
}
