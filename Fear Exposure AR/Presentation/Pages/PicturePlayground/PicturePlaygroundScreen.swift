//
//  PicturePlaygroundScreen.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 14/10/24.
//

import SwiftUI

struct PicturePlaygroundScreen : View {
    
    @State var viewModel = PicturePlaygroundViewModel()
    
    var body: some View {
        ZStack (alignment : .bottom) {
            Image("Image/Data/SadHamster")
                .resizable()
                .scaledToFit()
                .font(.title)
                .scaleEffect(viewModel.currentZoom + viewModel.totalZoom)
                .gesture(
                    MagnificationGesture()
                        .onChanged { value in
                            viewModel.onChangedZoom(value)
                        }
                        .onEnded { value in
                            viewModel.onEndedZoom()
                        }
                )
            
            Button(action: {
                viewModel.onResetZoom()
            }, label: {
                Text("Reset")
            })
            .buttonStyle(.borderedProminent)
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    PicturePlaygroundScreen()
}
