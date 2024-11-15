//
//  CompleteScreen.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 11/11/24.
//

import SwiftUI

struct CompleteScreen : View {
    
    @State var viewModel : CompleteViewModel = CompleteViewModel()
    @Environment(Router.self) var router
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack {
                    Image("image/illustration/complete")
                        .resizable()
                        .scaledToFit()
                    Spacer()
                        .frame(height: 24)
                    Text ("Congratulations on completing your session!")
                        .font(.title2)
                        .bold()
                        .multilineTextAlignment(.center)
                    Spacer()
                        .frame(height: 16)
                    // TODO : Changed for Dark Mode
                    Text ("Redirecting to your session results in \( Int(viewModel.timerCount) ) seconds...")
                        .font(.body)
                        .foregroundStyle(.gray)
                        .multilineTextAlignment(.center)
                }
                .padding()
                VStack {
                    Spacer()
                    Divider()
                    
                    Button(action: {
                        if let resultId = viewModel.resultId {
                            router.navigate(to: .detailResult(id: resultId))
                        } else {
                            router.navigateToRoot()
                        }
                    }, label: {
                        Text ("See Test Result")
                            .font(.body)
                            .bold()
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 6)
                    })
                    .buttonStyle(.borderedProminent)
                    .padding(.horizontal)
                    .padding(.top)
                    .padding(.bottom, 48)
                    .background(Color(Theme.background.rawValue))
                }
            }
            .ignoresSafeArea()
        }
        .onAppear{
            viewModel.startTimer(block: { timer in
                print(viewModel.timerCount)
                viewModel.countTimer()
                if (viewModel.timerCount == 0){
                    viewModel.stopTimer()
                    viewModel.resetTimer()
                    if let resultId = viewModel.resultId {
                        router.navigate(to: .detailResult(id: resultId))
                    } else {
                        router.navigateToRoot()
                    }
                }
            })
            viewModel.getResultId()
        }
        .alert(
            "Error",
            isPresented: Binding(
                get: {
                    viewModel.errorMessage != nil
                },
                set: { _ in
                    
                }
            ),
            actions: {
                Button(
                    role: .cancel,
                    action: {
                        viewModel.clearErrorMessage()
                    },
                    label: {
                        Text("Okay")
                    }
                )
            },
            message: {
                Text(viewModel.errorMessage ?? "Unexpected Error Occured")
            }
        )
        .onDisappear{
            viewModel.stopTimer()
            viewModel.resetTimer()
        }
        
    }
    
}

#Preview {
    NavigationStack {
        CompleteScreen()
    }
    .environment(Router())
    .tint(Color(Theme.primary500.rawValue))
}
