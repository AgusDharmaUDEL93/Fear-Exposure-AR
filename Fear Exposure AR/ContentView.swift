//
//  ContentView.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 14/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var router = Router()
    
    var body: some View {
        NavigationStack (path : $router.navPath)  {
            Group {
                if #available(iOS 18.0, *) {
                    TabView {
                        Tab("Today", systemImage: "star.fill") {
                            TherapyScreen()
                        }
                        Tab("Today", systemImage: "star.fill") {
                            TherapyScreen()
                        }
                        Tab("Today", systemImage: "star.fill") {
                            TherapyScreen()
                        }
                    }
                } else {
                    TabView {
                        TherapyScreen()
                            .tabItem {
                                Label("Today", systemImage: "star.fill")
                            }
                        TherapyScreen()
                            .tabItem {
                                Label("Today", systemImage: "star.fill")
                            }
                        TherapyScreen()
                            .tabItem {
                                Label("Today", systemImage: "star.fill")
                            }
                    }
                    
                }
            }
            .navigationTitle("Today")
            .navigationDestination(
                for: Router.Destination.self,
                destination:  { destination in
                    switch destination {
                    case .arPlayground:
                        ARPlaygroundScreen()
                    case .picturePlayground:
                        PicturePlaygroundScreen()
                    case .theraphy:
                        TherapyScreen()
                    case .theraphyType:
                        TherapyTypeScreen()
                    case .reflection:
                        ReflectionScreen()
                    case .summary:
                        SummaryScreen()
                    case .userInfo:
                        UserInfoScreen()
                    case .difficultyType:
                        DifficultyTypeScreen()
                    }
                }
            )
            
            
        }

        .tint(Color(Theme.primary500.rawValue))
        .environment(router)
        
    }
}

#Preview {
    ContentView()
}
