//
//  CardTherapy.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 14/10/24.
//

import SwiftUI


struct CardTherapy : View {
    
    let title : String
    let description : Text
    let image : String
    let beginRangeTime : Int
    let endedRangeTime : Int
    let action : () -> Void
    
    var body: some View {
        VStack (alignment : .leading) {
            Image(image)
                .resizable()
                .scaledToFit()
            Group {
                Spacer()
                    .frame(height: 16)
                HStack {
                    Image(systemName: "clock.fill")
                    Text("\(beginRangeTime)-\(endedRangeTime) Minutes")
                        .font(.body)
                        .bold()
                }
                .foregroundStyle(Color(Theme.primary500.rawValue))
                Spacer()
                    .frame(height: 12)
                Text(title)
                    .font(.title3)
                    .bold()
                Spacer()
                    .frame(height: 12)
                Text("\(description)")
                    .font(.body)
                Spacer()
                    .frame(height: 16)
            }
            .padding(.horizontal, 16)
            Button(
                action: {
                    action()
                },
                label: {
                    Text("Start Therapy")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 6)
                        .font(.body)
                        .bold()
                }
            )
            .foregroundStyle(Color(Theme.background.rawValue))
            .tint(Color(Theme.primary500.rawValue))
            .padding([.bottom, .horizontal], 16)
            .buttonStyle(.borderedProminent)
            
        }
        .background(Color(Theme.primary50.rawValue))
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    CardTherapy(
        title: "Afraid of Snakes?",
        description: Text("Your daily \(Text("ophidiophobia").bold()) therapy session is ready"),
        image: "image/illustration/dummy_image",
        beginRangeTime: 15,
        endedRangeTime: 30,
        action: {
            
        }
    )
    .padding(16)
}
