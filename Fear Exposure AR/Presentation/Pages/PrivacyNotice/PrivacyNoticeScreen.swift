//
//  PrivacyNoticeScreen.swift
//  Fear Exposure AR
//
//  Created by Steven Ongkowidjojo on 12/11/24.
//

import SwiftUI

struct PrivacyNoticeScreen: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("At Denxéro, we are committed to protecting your privacy. The Denxéro AR Exposure Therapy App (\"Fear Exposure AR or FEAR\") does not collect, store, or share any personal data with third parties. All information related to your use of the app remains solely on your device. Denxéro will not access, analyze, or distribute any of your personal data. We encourage you to maintain the confidentiality of any information saved within the app. By using this app, you acknowledge and consent to these privacy practices and agree to take responsibility for securing your device and data.")
                Spacer()
            }
            .padding()
            .navigationTitle("Privacy Notice")
        }
    }
}

#Preview {
    PrivacyNoticeScreen()
        .environment(Router())
}
