//
//  ARPlaygroundScreen.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 14/10/24.
//

import SwiftUI
import RealityKit

struct ARPlaygroundScreen : View {
    
    @State var viewModel = ARPlaygroundViewModel()
    @Environment(Router.self) private var router
    @Environment(SettingUtils.self) private var settingUtils
    @ObservedObject var phoneConnectivityManager : PhoneConnectivityManager = PhoneConnectivityManager.shared
    
    var body : some View {
        GeometryReader { geometry in
            ZStack  {
                ARPlayground(
                    fearedObject: Binding(get: {
                        viewModel.phobia.fearedObject
                    }, set: {value in }),
                    scale: Binding(get: {
                        settingUtils.scale
                    }, set: {value in
                        settingUtils.scale = value
                    }),
                    isObjectFollowUser: Binding(get: {
                        settingUtils.isObjectFollowUser
                    }, set: {value in settingUtils.isObjectFollowUser = value}),
                    isScaleObject: $viewModel.isScaleObject,
                    arState: $viewModel.arState
                )
                .ignoresSafeArea()
                
                
                Group {
                    if (viewModel.phobia.fearedObject.isActive){
                        if (viewModel.isScaleObject){
                            VStack {
                                Spacer()
                                Slider(value: Binding(get: {
                                    settingUtils.scale
                                }, set: { value in
                                    settingUtils.scale = value
                                }))
                                Button(
                                    action: {
                                        viewModel.isDoneScaleObject()
                                    },
                                    label: {
                                        Text(
                                            "Done"
                                        )
                                        .font(.body)
                                        .bold()
                                        .frame(maxWidth: geometry.size.width)
                                        .padding(.vertical, 6)
                                        
                                    }
                                )
                                .buttonStyle(.borderedProminent)
                                .padding(.horizontal)
                                .padding(.top)
                                .padding(.bottom, 48)
                                .frame(maxWidth: .infinity)
                                .background(.black.opacity(0.75))
                                .ignoresSafeArea()
                                
                            }
                           
                        } else {
                            VStack {
                                Spacer()
                                HStack (
                                    alignment : .bottom
                                ) {
                                    Button(
                                        action : {
                                            viewModel.toogleConfirmationDialog()
                                        },
                                        label : {
                                            Image(systemName: "door.left.hand.closed")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(height : 25)
                                                .foregroundStyle(.white)
                                                .padding(23)
                                                .background(.black.opacity(0.75))
                                                .clipShape(Circle())
                                        })
                                    Spacer()
                                    VStack {
                                        Button(
                                            action : {
                                                viewModel.openModalSheet()
                                            },
                                            label : {
                                                Image(systemName: "slider.horizontal.3")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(height : 25)
                                                    .foregroundStyle(.white)
                                                    .padding(16)
                                                    .background(.black.opacity(0.75))
                                                    .clipShape(Circle())
                                            }
                                        )
                                        Button(
                                            action : {
                                                viewModel.stopTimer()
                                                viewModel.clearItem()
                                                phoneConnectivityManager.stopSession()
                                            },
                                            label : {
                                                Image(systemName: "arrow.up.and.down.and.arrow.left.and.right")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(height : 25)
                                                    .foregroundStyle(.white)
                                                    .padding(20)
                                                    .background(.black.opacity(0.75))
                                                    .clipShape(Circle())
                                            }
                                        )
                                    }
                                    
                                }
                                .padding(.horizontal)
                            }
                        }

                        
                    } else {
                        VStack {
                            Spacer()
                            // TODO : START SESSION
                            Button(
                                action: {
                                    viewModel.placeItem()
                                    viewModel.hideBackButton()
                                    viewModel.startTimer(block: { timer in
                                        viewModel.countTimer()
                                    })
                                    phoneConnectivityManager.startSession()
                                    phoneConnectivityManager.sendMessage(["action": "start", "elapsedTime": phoneConnectivityManager.elapsedTime])
                                },
                                label: {
                                    Label(
                                        "Place & Start",
                                        systemImage:  "play.fill"
                                    )
                                    .font(.body)
                                    .bold()
                                    .frame(maxWidth: geometry.size.width)
                                    .padding(.vertical, 6)
                                    
                                }
                            )
                            .buttonStyle(.borderedProminent)
                            .padding(.horizontal)
                            .padding(.top)
                            .padding(.bottom, 48)
                            .frame(maxWidth: .infinity)
                            .background(.black.opacity(0.75))
                            .ignoresSafeArea()
                            
                        }
                        
                        
                    }
                }
                
            }
        }
        .toolbarBackground(.black.opacity(0.75), for: .navigationBar)
        .toolbarBackground(viewModel.phobia.fearedObject.isActive ? .hidden : .visible, for: .navigationBar)
        .navigationBarBackButtonHidden()
        .alert(
            "End Therapy Session?",
            isPresented: $viewModel.isConfirmationDialogShow,
            actions: {
                
                Button("Cancel", role: .cancel, action: {
                    viewModel.toogleConfirmationDialog()
                })
                
                // TODO : END SESSION
                Button ("End Session", role: .destructive, action: {
                    viewModel.clearItem()
                    viewModel.toogleConfirmationDialog()
                    phoneConnectivityManager.stopSession()
                    viewModel.stopTimer()
                    print("AR Playground : \(viewModel.phobia.name)")
                    router.navigate(to: .reflection(phobiaId: viewModel.phobia.id, phobiaName: viewModel.phobia.name, heartRate: viewModel.heartRateData, duration: viewModel.timerCount))
                })
            },
            message: {
                Text("Are you sure want to end this session?")
            }
        )
        .onChange(of: phoneConnectivityManager.currentHeartRate, initial: true, {_, value  in
            viewModel.onChangedHeartRateData(value: value)
        })
        .onAppear{
            viewModel.getPhobiaById(id: settingUtils.phobiaId)
            viewModel.resetTimer()
        }
        .sheet(isPresented: $viewModel.isModalSheetOpen ){
            NavigationStack {
                SettingsARScreen(
                    isScaleObject: $viewModel.isScaleObject,
                    isOpenModalSheets: $viewModel.isModalSheetOpen,
                    onScaleObject: {
                        viewModel.onScaledObject()
                        viewModel.closeModalSheet()
                    },
                    onToggleButton: { value in
                        if (value == true){
                            viewModel.onObjectIsFollowUser()
                        } else {
                            viewModel.onObjectIsNotFollowUser()
                        }
                    }
                )
            }
        }
    }
}

#Preview {
    NavigationStack {
        ARPlaygroundScreen()
            .environment(Router())
            .environment(SettingUtils())
    }
    .tint(Color(Theme.primary500.rawValue))
}
