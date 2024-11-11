//
//  PicturePlaygroundScreen.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 14/10/24.
//

import SwiftUI

struct PicturePlaygroundScreen : View {
    
    @State var viewModel = PicturePlaygroundViewModel()
    @Environment(Router.self) var router
    @State var phoneConnectivityManager : PhoneConnectivityManager = PhoneConnectivityManager.shared
    @Environment(SettingUtils.self) var settings
    
    @State private var selection = 0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if viewModel.isObjectReveal {
                    
                    TabView (selection : $selection) {
                        Image("image/data/image_snake")
                            .resizable()
                            .scaledToFit()
                            .padding(80)
                            .scaleEffect(viewModel.currentZoom + viewModel.totalZoom)
                        Image("image/data/image_snake")
                            .resizable()
                            .scaledToFit()
                            .padding(80)
                            .scaleEffect(viewModel.currentZoom + viewModel.totalZoom)
                        Image("image/data/image_snake")
                            .resizable()
                            .scaledToFit()
                            .padding(80)
                            .scaleEffect(viewModel.currentZoom + viewModel.totalZoom)
                    }
                    .tabViewStyle(.page)
                    
                    VStack {
                        Spacer()
                        
                        Text("Gradually increase the size of the snake")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(8)
                            .background(Color.black.opacity(0.7))
                            .cornerRadius(8)
                        
                        HStack {
                            Text("-")
                                .font(.title)
                            Spacer()
                            Slider(value: $viewModel.currentZoom)
                                .accentColor(Color(Theme.primary500.rawValue))
                            Spacer()
                            Text("+")
                                .font(.title)
                        }
                        
                        Button(
                            action: {
                                viewModel.toogleConfirmationDialog()
                            },
                            label: {
                                Label(
                                    "End Session",
                                    systemImage:  "x.circle.fill"
                                )
                                .font(.body)
                                .bold()
                                .frame(maxWidth: geometry.size.width)
                                .padding(.vertical, 6)
                                
                            }
                        )
                        .buttonStyle(.borderedProminent)
                        .frame(maxWidth: .infinity)
                        
                        Spacer()
                            .frame(height: 32)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 12)
                    
                } else {
                    VStack {
                        Spacer()
                        
                        Rectangle()
                            .stroke(Color.black, lineWidth: 8)
                            .frame(width: 100, height: 100)
                        
                        Spacer()
                    }
                    VStack {
                        Spacer()
                        
                        Text("Start your session by revealing your object")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(8)
                            .background(Color.black.opacity(0.7))
                            .cornerRadius(8)
                        Spacer()
                            .frame(height: 16)
                        Button(
                            action: {
                                viewModel.onRevealObject()
                                viewModel.startTimer(block: { timer in
                                    viewModel.countTimer()
                                })
                                phoneConnectivityManager.sendMessage(["action": "start", "elapsedTime": phoneConnectivityManager.elapsedTime])
                            },
                            label: {
                                Label(
                                    "Reveal Object",
                                    systemImage: "play.fill"
                                )
                                .font(.body)
                                .bold()
                                .frame(maxWidth: geometry.size.width)
                                .padding(.vertical, 6)
                                
                            }
                        )
                        .buttonStyle(.borderedProminent)
                        .frame(maxWidth: .infinity)
                        
                        
                        
                        Spacer().frame(height: 32)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 12)
                    
                    
                }
            }
            .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height)
            .background(Color.white)
            .gesture(
                MagnificationGesture()
                    .onChanged { value in
                        
                        viewModel.onMagnifierGesture(value: value)
                        
                    }
                    .onEnded { _ in
                        viewModel.onEndedMagnifier()
                    }
            )
            .alert(
                "End Therapy Session?",
                isPresented: $viewModel.isConfirmationDialogShow,
                actions: {
                    
                    Button("Cancel", role: .cancel, action: {
                        viewModel.toogleConfirmationDialog()
                    })
                    
                    Button ("End Session", role: .destructive, action: {
                        viewModel.onDisapearObject()
                        
                        viewModel.onResetZoom()
                        
                        viewModel.toogleConfirmationDialog()
                        viewModel.stopTimer()
                        phoneConnectivityManager.stopSession()
                        
                        router.navigate(to: .reflection (phobiaId : viewModel.phobia.id, phobiaName: viewModel.phobia.name , heartRate: viewModel.heartRateData, duration: viewModel.timerCount))
                        
                    })
                    
                    
                    
                },
                message: {
                    Text("A message should be a short, complete sentence.")
                }
            )
            
        }
        .onChange(of: phoneConnectivityManager.currentHeartRate, initial: true, {_, value  in
            viewModel.onChangedHeartRateData(value: value)
        })
        .onAppear{
            viewModel.resetTimer()
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    NavigationStack {
        PicturePlaygroundScreen()
    }
    .tint(Color(Theme.primary500.rawValue))
    .environment(Router())
    .environment(SettingUtils())
}
