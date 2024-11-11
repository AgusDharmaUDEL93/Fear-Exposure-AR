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
                        router.navigateToRoot()
                    }, label: {
                        Text ("See Test Result")
                            .font(.body)
                            .bold()
                            .frame(maxWidth: geometry.size.width)
                            .padding(.vertical, 6)
                    })
                    .buttonStyle(.borderedProminent)
                    .padding(.horizontal)
                    .padding(.top)
                    .padding(.bottom, 48)
                    .background(Color(Theme.background.rawValue))
                    .frame(maxWidth: .infinity)
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
                    router.navigateToRoot()
                }
            })
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
