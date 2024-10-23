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
        GeometryReader { geometry in
            ZStack{
                Image("image/data/image_snake")
                    .resizable()
                    .scaledToFit()
                    .font(.title)
                    .padding(60)
                    .scaleEffect(viewModel.currentZoom + viewModel.totalZoom)
                VStack  {
                    Spacer()
                    Slider(value: $viewModel.currentZoom)
                    Spacer()
                        .frame(height: 32)
                    Button(action: {
                        viewModel.onResetZoom()
                    }, label: {
                        Text("Reset")
                            .font(.body)
                            .bold()
                            .frame(maxWidth: geometry.size.width)
                            .padding(.vertical, 6)
                    })
                    .padding(.bottom, 48)
                    .buttonStyle(.borderedProminent)
                }
                .padding(.horizontal, 16)
            }
            .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height)
            .background()
//            .gesture(
//                MagnificationGesture()
//                    .onChanged { value in
//                        viewModel.onChangedZoom(value)
//                    }
//                    .onEnded { value in
//                        viewModel.onEndedZoom()
//                    }
//            )
        }
        
        .ignoresSafeArea(.all)
    }
}

#Preview {
    PicturePlaygroundScreen()
}
