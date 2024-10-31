//
//  TermsAndConditionScreen.swift
//  Fear Exposure AR
//
//  Created by Steven Ongkowidjojo on 31/10/24.
//

import SwiftUI

struct TermsAndConditionScreen: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("By using the Denxéro AR Exposure Therapy App (\"Fear Exposure AR or FEAR\"), you acknowledge and agree that your use of the app is at your sole risk. Denxéro Team and its affiliates are not responsible or liable for any direct, indirect, incidental, consequential, or any other damages arising from your use of the app.")
                    Text("Always consult with a qualified healthcare provider or psychologist before starting any new treatment or therapy program, including the use of this app. By using the Denxéro AR Exposure Therapy App (\"Fear Exposure AR or FEAR\"), you acknowledge and agree to the following terms:")
                    
                    Group {
                        disclaimerItem(
                            number: "1.",
                            title: "No Guarantee of Cure",
                            description: "The app is intended to assist in exposure therapy and is designed to complement professional psychological treatment. Denxéro and its affiliates do not guarantee that the use of the App will cure any mental illness or psychological condition. Individual results may vary."
                        )
                        
                        disclaimerItem(
                            number: "2.",
                            title: "Medical Disclaimer",
                            description: "The app is not intended to replace professional medical advice, diagnosis, or treatment. Always consult with a qualified healthcare provider or psychologist before starting any new treatment or therapy program, including the use of this app."
                        )
                        
                        disclaimerItem(
                            number: "3.",
                            title: "User Responsibility",
                            description: "You are responsible for your own health and safety while using the app. Use the app in a safe environment, especially when engaging with Augmented Reality (AR) features. Be aware of your surroundings to prevent physical injury or property damage."
                        )
                        
                        disclaimerItem(
                            number: "4.",
                            title: "Limitation of Liability",
                            description: "To the fullest extent permitted by law, Denxéro and its affiliates shall not be liable for any direct, indirect, incidental, consequential, or any other damages arising from your use of, or inability to use, the app. This includes, but is not limited to, damages for loss of profits, goodwill, data, or other intangible losses."
                        )
                        
                        disclaimerItem(
                            number: "5.",
                            title: "Privacy and Data Use",
                            description: "Denxéro respects your privacy. All data is confidential and saved privately on your device. We do not store, share, or sell your personal information. It is your responsibility to keep your information private and secure."
                        )
                        
                        disclaimerItem(
                            number: "6.",
                            title: "Age Restrictions",
                            description: "The App is intended for use by individuals who have reached the age of majority as defined by the laws of their country or region. By using the app, you confirm that you meet this age requirement. If you are under the age of majority, you must obtain parental or guardian consent before using the app."
                        )
                        
                        disclaimerItem(
                            number: "7.",
                            title: "Updates to Terms and Conditions",
                            description: "Denxéro reserves the right to modify or update these terms and conditions at any time without prior notice. It is your responsibility to review the disclaimer periodically for any changes. Continued use of the app following any modifications indicates your acceptance of the new terms."
                        )
                        
                        disclaimerItem(
                            number: "8.",
                            title: "Acceptance of Terms",
                            description: "By using the app, you agree to abide by this disclaimer and all other associated agreements and policies."
                        )
                        
                        Text("By pressing “Agree” you agree to the disclaimer and have therefore read the Terms and Conditions to using Fear Exposure AR.")
                    }
                    HStack {
                        Button("Disagree") {
                            
                        }
                        .foregroundColor(.red)
                        
                        Spacer()
                        
                        Button("Agree") {
                            
                        }
                    }
                }
                .padding()
                .navigationTitle("Terms & Condition")
            }
        }
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
    TermsAndConditionScreen()
}
