//
//  TitleMonth.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 06/11/24.
//

import SwiftUI

struct CardLog : View {
    
    let phobiaName : String
    let feeling : Feeling
    let notes : String
    let heartRate : Double
    let duration : Double
    var isAnimal : Bool = true
    let date : Date
    
    var body: some View {
        VStack {
            HStack  {
                Image(systemName: isAnimal ? "pawprint.fill" : "shippingbox.fill")
                    .font(.subheadline)
                Spacer()
                    .frame(width: 8)
                Text(phobiaName)
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
                    Text(feeling.getEmoji())
                        .font(.system(size: 34))
                        .fontWeight(.semibold)
                    Spacer()
                        .frame(width: 8)
                    VStack (alignment : .leading) {
                        Text(feeling.getLabel())
                            .font(.body)
                            .bold()
                        Text("at \( date.formatted(date: .long, time: .omitted)), \(date.formatted(date: .omitted, time: .shortened))")
                            .font(.caption)
                            .foregroundStyle(Color(hex: 0x666666))
                    }
                    Spacer()
                }
                
                Text (notes)
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
                    if (heartRate == -1){
                        Text("Avg Heart rate: - BPM")
                            .font(.subheadline)
                            .foregroundStyle(Color(hex: 0x666666))
                    } else {
                        Text("Avg Heart rate: \(NSString(format : "%.1f", heartRate) ) BPM")
                            .font(.subheadline)
                            .foregroundStyle(Color(hex: 0x666666))
                    }
                   
                    Spacer()
                }
                HStack {
                    Image (systemName: "clock.fill")
                        .foregroundStyle(Color(Theme.primary500.rawValue))
                        .font(.body)
                    Spacer()
                        .frame(width: 8)
                    Text("Duration: \( Int(duration/60) ) Minutes \( (Int(duration) % 60) ) Seconds")
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
    CardLog(phobiaName: "Arachnophobia Therapy", feeling: .terrified, notes: "Today’s session went better than I expected. I managed to look at photos of small spiders without that usual rush of panic.", heartRate: 75, duration: 5, date: .now)
        .padding()
}
