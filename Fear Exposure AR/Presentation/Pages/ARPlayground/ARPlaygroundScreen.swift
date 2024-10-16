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
        ZStack (alignment : .bottom) {
            ARPlayground(fearedObject: $viewModel.fearedObject)
                .ignoresSafeArea()
            
            Group {
                if (viewModel.fearedObject.isActive){
                    Button(
                        action: {
                            viewModel.toogleConfirmationDialog()
                        },
                        label: {
                            Label(
                                "End Session",
                                systemImage:  "xmark.circle.fill"
                            )
                            .font(.body)
                            .bold()
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 6)
                        }
                    )
                    .foregroundStyle(Color(Theme.error.rawValue))
                } else {
                    Button(
                        action: {
                            viewModel.placeItem()
                            viewModel.hideBackButton()
                            DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(120)) {
                                router.navigateBack()
                                router.navigateBack()
                                router.navigate(to: .reflection)
                            }
                        },
                        label: {
                            Label(
                                "Place & Start",
                                systemImage:  "play.fill"
                            )
                            .font(.body)
                            .bold()
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 6)
                            
                        }
                    )
                    .foregroundStyle(Color(Theme.primary500.rawValue))
                    
                }
            }
            .buttonStyle(.borderedProminent)
            .tint(Color(Theme.background.rawValue))
            .padding(.bottom, 50)
            .padding(.horizontal)
            
        }
        .navigationBarBackButtonHidden(viewModel.isHideBackButton)
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
                    router.navigateBack()
                    router.navigateBack()
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
    }
}

#Preview {
    NavigationStack {
        ARPlaygroundScreen()
            .environment(Router())
    }
}
