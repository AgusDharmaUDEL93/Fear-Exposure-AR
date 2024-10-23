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
    @Environment(\.dismiss) var dismiss
    
    var body : some View {
        GeometryReader { geometry in
            ZStack  {
                                ARPlayground(
                                    fearedObject: $viewModel.fearedObject, onChangedLength: { value in
                                        viewModel.onChangedLength(value)
                                    }
                                )
                                .ignoresSafeArea()
                
                Group {
                    if (viewModel.fearedObject.isActive){
                        VStack {
                            
                            Spacer()
                            HStack {
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
                                    })
                            }
                            .padding(.horizontal)
                        }
                        
                    } else {
                        VStack {
                            Spacer()
                            VStack (spacing : 16){
                                HStack (spacing : 16){
                                    Image(systemName: "arrow.up")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height : 30)
                                        .foregroundColor(.white)
                                        .padding(16)
                                        .background(.white.opacity(0.25))
                                        .clipShape(.circle)
                                    VStack (alignment : .leading) {
                                        Text ("\(NSString(format: "%.01f", viewModel.length)) \(Text("meters").font(.title2)  )")
                                            .font(.largeTitle)
                                            .bold()
                                            .foregroundStyle(.white)
                                        Text("Point the camera at a flat surface")
                                            .font(.body)
                                            .foregroundStyle(.white)
                                    }
                                    Spacer()
                                    
                                }
                                Button(
                                    action: {
                                        viewModel.placeItem()
                                        viewModel.hideBackButton()
                                        viewModel.startTimer(block: { timer in
                                            print(viewModel.timerCount)
                                            viewModel.countTimer()
                                            if (viewModel.timerCount == 0){
                                                viewModel.stopTimer()
                                                viewModel.resetTimer()
                                                router.navigate(to: .reflection)
                                            }
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
                                .foregroundStyle(viewModel.isCanPlaced ? .white : .gray)
                                .disabled(!viewModel.isCanPlaced)
                                .buttonStyle(.borderedProminent)
                                .background(viewModel.isCanPlaced ? Color(hex: 0x55B5AB) : .white)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                
                            }
                            .padding(.horizontal)
                            .padding(.top)
                            .padding(.bottom, 48)
                            .frame(maxWidth: .infinity)
                            .background(.black.opacity(0.75))
                        }
                        .ignoresSafeArea()
                        
                        
                    }
                }
                
            }
        }
        .toolbar{
            ToolbarItem(placement : .topBarLeading){
                Button(action: {
                    dismiss()
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
        .alert(
            viewModel.errorMessage ?? "Unexpected Error Occured!",
            isPresented: Binding(
                get: {
                    viewModel.errorMessage != nil
                },
                set: {
                    if !$0 { viewModel.errorMessage = nil }
                }
            ),
            actions: {
                Button("OK", role: .cancel) {}
            }
        )
        .onDisappear(perform: {
            viewModel.stopTimer()
            viewModel.resetTimer()
        })
    }
}

#Preview {
    NavigationStack {
        ARPlaygroundScreen()
            .environment(Router())
    }
    .tint(Color(Theme.primary500.rawValue))
}
