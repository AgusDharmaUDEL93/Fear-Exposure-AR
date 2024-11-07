//
//  IntroductionPhobiaScreen.swift
//  Fear Exposure AR
//
//  Created by Steven Ongkowidjojo on 07/11/24.
//

import SwiftUI

struct IntroductionPhobiaScreen: View {
    var body: some View {
        GeometryReader { geometry in
            TitleScreen(
                title: "Phobia List",
                description: "Select all the phobias that apply to you. Don’t worry, you can update these choices later."
            )
        }
    }
}

#Preview {
    IntroductionPhobiaScreen()
}
