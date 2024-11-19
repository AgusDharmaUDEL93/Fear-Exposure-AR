//
//  AboutScreen.swift
//  Fear Exposure AR
//
//  Created by Steven Ongkowidjojo on 10/11/24.
//

import SwiftUI

struct AboutScreen: View {
    var body: some View {
            ScrollView {
                VStack {
                    Text("FEAR is an iOS app designed to support individuals with phobias in confronting and managing their fears. Utilizing Digital Systematic Desensitization, or Exposure Therapy, FEAR gradually introduces users to feared objects in both 2D images and immersive 3D AR formats. By tracking heart rate via Apple Watch integration, FEAR provides a clear and measurable way to monitor progress and improvements over time, helping users on their journey to overcome their fears.")
                        .padding(.bottom, 20)
                    
                    HStack {
                        Text("Acknowledgments")
                            .font(.title2)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .padding(.bottom, 8)
                    
                    Text("We extend our heartfelt thanks to our friends and families who supported us, both directly and indirectly, throughout the development of this app. We are also incredibly grateful to the Apple Developer Academy @UC for their invaluable support and guidance.")
                        .padding(.bottom, 20)
                    
                    HStack {
                        Text("User Testing and Interviews")
                            .font(.title2)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .padding(.bottom, 8)
                    
                    HStack {
                        Text("Our sincere appreciation goes to those who participated in user testing and interviews, providing valuable insights to refine the user experience:")
                        Spacer()
                    }
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("""
                                                   • Dr. Efendi Rimba Sp.KJ
                                                   • Dr. Harsono Wiradinata Sp.KJ
                                                   • Jessica Christina Widihgdo, S.Psi., M.Psi
                                                   • Stefani Virlia, S.Psi., M.Psi
                                               """)
                            Spacer()
                        }
                    }
                    .padding(.bottom, 20)
                    
                    HStack {
                        Text("Special Thanks")
                            .font(.title2)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .padding(.bottom, 8)
                    
                    HStack {
                        Text("A special thank you to everyone who contributed suggestions and feedback to help improve our app:")
                        Spacer()
                    }
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("""
                                                   • Angela Melia Gunawan
                                                   • Devon
                                                   • Jaya Pranata
                                                   • Shannon Chrestella Valencia
                                                   • Tifara Levi, S.Psi
                                               """)
                            Spacer()
                        }
                    }
                    
                    Spacer()
                }
                .navigationTitle("About")
                .padding()
            }
        
    }
}

#Preview {
    NavigationStack {
        AboutScreen()
    }
}
