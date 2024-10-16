//
//  ResultScreen.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 14/10/24.
//

import SwiftUI

struct ReflectionScreen: View {
    
    enum Field {
        case before
        case after
    }
    
    @Environment(Router.self) private var router
    @State var viewModel = ReflectionViewModel()
    @FocusState private var focusedField: Field?
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                Text("What do you feel during this session?")
                    .font(.body)
                    .bold()
                Spacer()
                    .frame(height: 16)
                HStack (
                    alignment : .center,
                    spacing: 8
                ) {
                    ChipEmoji(
                        isActive: $viewModel.isActiveArray[Feeling.veryHappy.rawValue],
                        action : {
                            viewModel.onChangedIsActiveStatus(targetIndex: Feeling.veryHappy.rawValue)
                        },
                        emoji: .veryHappy
                    )
                    ChipEmoji(
                        isActive: $viewModel.isActiveArray[Feeling.happy.rawValue],
                        action: {
                            viewModel.onChangedIsActiveStatus(targetIndex: Feeling.happy.rawValue)
                        },
                        emoji: .happy
                    )
                    ChipEmoji(
                        isActive: $viewModel.isActiveArray[Feeling.neutral.rawValue],
                        action: {
                            viewModel.onChangedIsActiveStatus(targetIndex: Feeling.neutral.rawValue)
                        },
                        emoji: .neutral
                    )
                    ChipEmoji(
                        isActive: $viewModel.isActiveArray[Feeling.notHappy.rawValue],
                        action: {
                            viewModel.onChangedIsActiveStatus(targetIndex: Feeling.notHappy.rawValue)
                        },
                        emoji: .notHappy
                    )
                    ChipEmoji(
                        isActive: $viewModel.isActiveArray[Feeling.crying.rawValue],
                        action: {
                            viewModel.onChangedIsActiveStatus(targetIndex: Feeling.crying.rawValue)
                        },
                        emoji: .crying
                    )
                }
                .frame(maxWidth: .infinity)
                Spacer()
                    .frame(height: 48)
                Text("How do you feel now compared to before the therapy session began?")
                    .font(.body)
                    .bold()
                
                TextField("Answer Here", text: $viewModel.beforeText, axis: .vertical)
                    .lineLimit(5...10)
                    .focused($focusedField, equals: .before)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.leading)
                Spacer()
                    .frame(height: 48)
                Text("How do you feel about facing the fear-inducing situation or object outside of the therapy session?")
                    .font(.body)
                    .bold()
                
                TextField("Answer Here", text: $viewModel.afterText, axis: .vertical)
                    .lineLimit(5...10)
                    .focused($focusedField, equals: .after)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.leading)
                
                Spacer()
                    .frame(height: 48)
                
                Button(action: {
                    router.navigateBack()
                    router.navigate(to: .summary)
                }, label: {
                    Text("Done")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 6)
                        .foregroundStyle(Color(Theme.background.rawValue))
                        .bold()
                })
                .tint(Color(Theme.primary500.rawValue))
                .buttonStyle(.borderedProminent)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 16)
            
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                
                Button("Done") {
                    focusedField = nil
                }
            }
        }
        .navigationTitle("Session Reflection")
        .navigationBarTitleDisplayMode(.large)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    NavigationStack {
        ReflectionScreen()
    }
    .environment(Router())
}
