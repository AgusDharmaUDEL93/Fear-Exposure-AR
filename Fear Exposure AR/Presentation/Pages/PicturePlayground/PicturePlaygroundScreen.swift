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
    @State private var isObjectRevealed: Bool = false
    let minZoom: CGFloat = 0
    let maxZoom: CGFloat = 1
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if isObjectRevealed {
                    Image("image/data/image_snake")
                        .resizable()
                        .scaledToFit()
                        .padding(80)
                        .scaleEffect(viewModel.currentZoom + viewModel.totalZoom)
                    
                    VStack {
                        Spacer()
                        
                        VStack(spacing: 16) {
                            Text("Gradually increase the size of the snake")
                                .font(.subheadline)
                                .foregroundColor(.white)
                                .padding(.horizontal, 40)
                                .padding(.vertical, 8)
                                .background(Color.black.opacity(0.7))
                                .cornerRadius(8)
                            
                            HStack {
                                Text("-")
                                    .font(.title)
                                
                                Slider(value: $viewModel.currentZoom, in: minZoom...maxZoom)
                                    .accentColor(Color(Theme.primary500.rawValue))
                                
                                Text("+")
                                    .font(.title)
                            }
                            .padding(.horizontal, 20)
                        }
                        
                        Button(action: {
                            isObjectRevealed = false
                            viewModel.currentZoom = minZoom
                            
                        }) {
                            HStack {
                                Image(systemName: "x.circle.fill")
                                Text("End Session")
                            }
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(Theme.primary500.rawValue))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                        }
                        .padding(.horizontal, 16)
                        
                        Spacer().frame(height: 32)
                    }
                    .padding(EdgeInsets(top: 0, leading: 8, bottom: 12, trailing: 8))
                } else {
                    VStack {
                        Spacer().frame(height: 380)
                        
                        Rectangle()
                            .stroke(Color.black, lineWidth: 8)
                            .frame(width: 100, height: 100)
                        
                        Spacer().frame(height: 252)
                        
                        VStack(spacing: 12) {
                            Text("Start your session by revealing your object")
                                .font(.subheadline)
                                .foregroundColor(.white)
                                .padding(.horizontal, 36)
                                .padding(.vertical, 8)
                                .background(Color.black.opacity(0.7))
                                .cornerRadius(8)
                            
                            Button(action: {
                                isObjectRevealed = true
                            }) {
                                HStack {
                                    Image(systemName: "play.fill")
                                        .font(.headline)
                                    Text("Reveal Object")
                                        .font(.headline)
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color(Theme.primary500.rawValue))
                                .foregroundColor(.white)
                                .cornerRadius(8)
                            }
                            .padding(.horizontal, 20)
                        }
                        
                        Spacer()
                    }
                }
            }
            .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height)
            .background(Color.white)
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
                        magnification = 1.0
                    }
            )
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    PicturePlaygroundScreen()
}
