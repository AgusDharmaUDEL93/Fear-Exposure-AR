//
//  TermsAndConditionScreen.swift
//  Fear Exposure AR
//
//  Created by Steven Ongkowidjojo on 31/10/24.
//

import SwiftUI

struct TermsAndConditionScreen: View {
    @State private var hasScrolledToEnd = false
    var isOnlyShowing : Bool
    
    @Environment(Router.self) private var router
    
    var body: some View {
        VStack {
            EndDetectionScrollView (.vertical, showIndicators: false, hasScrolledToEnd: $hasScrolledToEnd) {
                VStack(alignment: .leading, spacing: 20) {
                    Text("The Fear Exposure AR (FEAR) app has been evaluated by licensed psychologists. Credits in the about section for further information. \n\nBy using the Denxéro AR Exposure Therapy app (\"Fear Exposure AR or FEAR\"), the user acknowledges and agrees to the following terms:")
                    
                    Group {
                        disclaimerItem(
                            number: "1.",
                            title: "No Guarantee of Cure",
                            description: "This app is intended to assist in exposure therapy and is designed to complement professional psychological treatment. Denxéro and its affiliates do not guarantee that the use of this app will cure any mental illness or psychological condition. Individual results may vary."
                        )
                        
                        disclaimerItem(
                            number: "2.",
                            title: "Medical Disclaimer",
                            description: "This app is not intended to replace professional medical advice, diagnosis, or treatment. Always consult with a qualified healthcare provider or psychologist before starting any new treatment or therapy program, including the use of this app."
                        )
                        
                        disclaimerItem(
                            number: "3.",
                            title: "User Responsibility",
                            description: "The user is responsible for their own health and safety while using this app. Use this app in a safe environment, especially when engaging with Augmented Reality (AR) features. Be aware of your surroundings to prevent physical injury or property damage."
                        )
                        
                        disclaimerItem(
                            number: "4.",
                            title: "Limitation of Liability",
                            description: "To the fullest extent permitted by law, Denxéro and its affiliates shall not be liable for any direct, indirect, incidental, consequential, or any other damages arising from your use of, or inability to use, this app. This includes, but is not limited to, damages for loss of profits, goodwill, data, or other intangible losses."
                        )
                        
                        disclaimerItem(
                            number: "5.",
                            title: "Privacy and Data Use",
                            description: "Denxéro respects your privacy. All data is confidential and saved privately on your device. We do not store, share, or sell your personal information. It is your responsibility to keep your information private and secure."
                        )
                        
                        disclaimerItem(
                            number: "6.",
                            title: "Age Restrictions",
                            description: "This app is intended for use by individuals who have reached the age of majority as defined by the laws of their country or region. By using this app, the user confirms that they have met this age requirement. If the user is under the age of majority, they must obtain parental or guardian consent before using this app."
                        )
                        
                        disclaimerItem(
                            number: "7.",
                            title: "Updates to Terms and Conditions",
                            description: "Denxéro reserves the right to modify or update these terms and conditions at any time without prior notice. It is the user’s responsibility to review the disclaimer periodically for any changes. Continued use of this app following any modifications indicates your acceptance of the new terms."
                        )
                        
                        disclaimerItem(
                            number: "8.",
                            title: "Potential Side Effects",
                            description: "By using the app, users may temporarily increase anxiety, distress, or physical symptoms like elevated heart rate as part of the exposure process. If symptoms worsen or become difficult to manage, consult a licensed psychologist or psychiatrist."
                        )
                        
                        disclaimerItem(
                            number: "9.",
                            title: "Acceptance of Terms",
                            description: "By using this app, user agrees to abide by this disclaimer and all other associated agreements and policies."
                        )
                    }
                    .background(
                        GeometryReader { geometry in
                            Color.clear
                                .onAppear {
                                    print(geometry.size.height)
                                }
                        }
                    )
                }
                .padding()
            }
    
            
            
            if (!isOnlyShowing){
                Text("By pressing “I Accept” the user agrees to the disclaimer and have therefore read the Terms and Conditions to using Fear Exposure AR.")
                    .font(.footnote)
                    .padding(EdgeInsets(top: 8, leading: 10, bottom: 0, trailing: 10))
                
                Button(action: {
                    router.navigate(to: .introductionPhobia)
                }) {
                    Text("I Accept")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(hasScrolledToEnd ? Color(Theme.primary500.rawValue) : Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                .disabled(!hasScrolledToEnd)
            }
        }
        .navigationTitle("Terms and Conditions")
        
    }
    
    
    private func disclaimerItem(number: String, title: String, description: String) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .top) {
                Text(number)
                    .font(.body)
                    .fontWeight(.bold)
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.body)
                        .fontWeight(.bold)
                    Text(description)
                        .font(.body)
                }
            }
        }
    }
    
}

#Preview {
    NavigationStack {
        TermsAndConditionScreen(
            isOnlyShowing: false
        )

    }
    .environment(Router())

}
