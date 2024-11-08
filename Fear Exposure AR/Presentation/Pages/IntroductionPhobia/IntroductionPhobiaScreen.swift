//
//  IntroductionPhobiaScreen.swift
//  Fear Exposure AR
//
//  Created by Steven Ongkowidjojo on 07/11/24.
//

import SwiftUI

struct IntroductionPhobiaScreen: View {
    
    @State var viewModel : IntroductionPhobiaViewModel = IntroductionPhobiaViewModel()
    @Environment(Router.self) private var router
    @AppStorage("isFirst") private var isFirst : Bool = true

    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ScrollView {
                    TitleScreen(
                        title: "Phobia List",
                        description: "Select all the phobias that apply to you. Don’t worry, you can update these choices later."
                    )
                    LazyVGrid (
                        columns: [
                            GridItem(.adaptive(minimum: 100)),
                            GridItem(.adaptive(minimum: 100))
                        ],
                        spacing: 16
                    ){
                        ForEach(viewModel.getAllPhobia(), id: \.id){data in
                            ChipSelection(
                                label: data.name,
                                isSelected: Binding(get: {
                                    viewModel.selectedPhobia.contains(data.id)
                                }, set: {value in
                                    
                                }),
                                onTapAnswer: {
                                    viewModel.onTapSelection(id: data.id)
                                }
                            )
                            
                        }
                    }
                    .padding( 16)
                    Spacer()
                        .frame(height: 40)
                }
                VStack {
                    Spacer()
                    Button(action: {
                        router.navigateToRoot()
                        isFirst = false
                    }, label: {
                        Text ("Submit")
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
                    .disabled(viewModel.selectedPhobia.isEmpty)
                }
                .ignoresSafeArea()
            }
            
        }
    }
}

#Preview {
    NavigationStack {
        IntroductionPhobiaScreen()
    }
    .environment(Router())
    .tint(Color(Theme.primary500.rawValue))
}
