//
//  TitleMonth.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 06/11/24.
//

import SwiftUI

struct CardLog : View {
    
    
    
    var body: some View {
        VStack {
            HStack  {
                Image(systemName: "pawprint.fill")
                    .font(.subheadline)
                Spacer()
                    .frame(width: 8)
                Text("Arachnophobia Therapy")
                    .font(.subheadline)
                    .bold()
                   
                Spacer()
                Image(systemName: "chevron.right")
                
            }
            .padding(16)
            .frame(maxWidth: .infinity)
            .background(Color(Theme.primary100.rawValue))
            .foregroundStyle(Color(Theme.primary500.rawValue))
            
            // TODO : FIX THE 0X66666 COLOR
            VStack (spacing : 16) {
                HStack {
                    Text("😭")
                        .font(.system(size: 34))
                        .fontWeight(.semibold)
                    Spacer()
                        .frame(width: 8)
                    VStack (alignment : .leading) {
                        Text("Feeling Neutral")
                            .font(.body)
                            .bold()
                        Text("at November 16, 18:30 PM")
                            .font(.caption)
                            .foregroundStyle(Color(hex: 0x666666))
                    }
                    Spacer()
                }
                
                Text ("Today’s session went better than I expected. I managed to look at photos of small spiders without that usual rush of panic.")
                    .lineLimit(3)
                    .font(.subheadline)
                    .foregroundStyle(Color(hex: 0x666666))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    Image (systemName: "heart.fill")
                        .foregroundStyle(Color(Theme.primary500.rawValue))
                        .font(.body)
                    Spacer()
                        .frame(width: 8)
                    Text("Heart rate: 72-120 BPM")
                        .font(.subheadline)
                        .foregroundStyle(Color(hex: 0x666666))
                    Spacer()
                }
                HStack {
                    Image (systemName: "clock.fill")
                        .foregroundStyle(Color(Theme.primary500.rawValue))
                        .font(.body)
                    Spacer()
                        .frame(width: 8)
                    Text("Duration: 20 Mins")
                        .font(.subheadline)
                        .foregroundStyle(Color(hex: 0x666666))
                    Spacer()
                }
               
                
            }
            .padding(16)
        }
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .background {
            RoundedRectangle(cornerRadius: 8)
                .stroke(.fill, lineWidth: 1)
        }
    }
}

#Preview {
    CardLog()
}
