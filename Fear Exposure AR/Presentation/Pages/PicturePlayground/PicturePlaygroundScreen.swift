//
//  PicturePlaygroundScreen.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 14/10/24.
//

import SwiftUI

struct PicturePlaygroundScreen : View {
    
    @State var viewModel = PicturePlaygroundViewModel()
    @State private var magnification: CGFloat = 1.0
    let minZoom: CGFloat = 0
    let maxZoom: CGFloat = 1
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                Image("image/data/image_snake")
                    .resizable()
                    .scaledToFit()
                    .font(.title)
                    .padding(80)
                    .scaleEffect(viewModel.currentZoom + viewModel.totalZoom)
                
                VStack  {
                    Spacer()
                    
                    HStack {
                        Text("-")
                            .font(.title)
                        
                        Slider(value: $viewModel.currentZoom)
                            .accentColor(Color(Theme.primary500.rawValue))
                        
                        Text("+")
                            .font(.title)
                    }
                    .padding(.horizontal, 4)
                    
                    Spacer()
                        .frame(height: 32)
                }
                .padding(.horizontal, 16)
            }
            .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height)
            .background()
            .gesture(
                MagnificationGesture()
                    .onChanged { value in
                        let delta = value - magnification
                        
                        // Apply zoom with bounds check
                        let newZoom = viewModel.currentZoom + delta
                        if newZoom >= minZoom && newZoom <= maxZoom {
                            viewModel.currentZoom = newZoom
                        }
                        
                        magnification = value
                    }
                    .onEnded { _ in
                        magnification = 1.0 // reset magnification to default after gesture ends
                    }
            )
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
