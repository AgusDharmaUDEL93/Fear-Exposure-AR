//
//  ARPlaygroundScreen.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 14/10/24.
//

import SwiftUI

struct ARPlaygroundScreen : View {
    
    @State var viewModel = ARPlaygroundViewModel()
    @Environment(Router.self) private var router
    
    var body : some View {
        GeometryReader { geometry in
            ZStack  {
                ARPlayground(
                    fearedObject: $viewModel.fearedObject
                )
                .ignoresSafeArea()
                
                Group {
                    if (viewModel.fearedObject.isActive){
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
                                            .padding(20)
                                            .background(.black.opacity(0.75))
                                            .clipShape(Circle())
                                    })
                                Spacer()
                                VStack {
                                    Button(
                                        action : {
                                            // TODO : Modal Sheet Open
                                            viewModel.openModalSheet()
                                        },
                                        label : {
                                            Image(systemName: "slider.horizontal.3")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(height : 25)
                                                .foregroundStyle(.white)
                                                .padding(20)
                                                .background(.black.opacity(0.75))
                                                .clipShape(Circle())
                                        }
                                    )
                                    Button(
                                        action : {
                                            viewModel.stopTimer()
                                            viewModel.clearItem()
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
                        
                    } else {
                        VStack {
                            Spacer()
                            Button(
                                action: {
                                    viewModel.placeItem()
                                    viewModel.hideBackButton()
                                    viewModel.startTimer(block: { timer in
                                        viewModel.countTimer()
                                    })
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
                            
                            
                        }
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
        .toolbar{
            ToolbarItem(placement : .topBarLeading){
                Button(action: {
                    router.navigateBack()
                }, label: {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Today")
                    }
                    
                })
                .foregroundStyle(.white)
                Spacer()
            }
            
        }
        .toolbarBackground(.black.opacity(0.75), for: .navigationBar)
        .toolbarBackground(viewModel.fearedObject.isActive ? .hidden : .visible, for: .navigationBar)
        .navigationBarBackButtonHidden()
        .alert(
            "End Therapy Session?",
            isPresented: $viewModel.isConfirmationDialogShow,
            actions: {
                
                Button("Cancel", role: .cancel, action: {
                    viewModel.toogleConfirmationDialog()
                })
                
                Button ("End Session", role: .destructive, action: {
                    viewModel.clearItem()
                    viewModel.toogleConfirmationDialog()
                    router.navigate(to: .reflection)
                })
                
                
                
            },
            message: {
                Text("A message should be a short, complete sentence.")
            }
        )
        .onDisappear(perform: {
            viewModel.stopTimer()
            viewModel.resetTimer()
        })
        .sheet(isPresented: $viewModel.isModalSheetOpen ){
            NavigationStack {
                SettingsARScreen()
            }
            
        }
    }
}

#Preview {
    NavigationStack {
        ARPlaygroundScreen()
            .environment(Router())
    }
    .tint(Color(Theme.primary500.rawValue))
}
