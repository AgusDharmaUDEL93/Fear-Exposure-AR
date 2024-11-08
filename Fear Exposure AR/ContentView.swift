//
//  ContentView.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 14/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var router = Router()
    @AppStorage("locale") private var locale = Locale.current.identifier
    @State var settings = SettingARUtils()
    @AppStorage("isFirst") private var isFirst : Bool = true
    
    var body: some View {
        NavigationStack (path : $router.navPath)  {
            if (isFirst){
                IntroductionPhobiaScreen()
            } else {
                Group {
                    if #available(iOS 18.0, *) {
                        TabView {
                            Tab("Theraphy", systemImage: "heart") {
                                TherapyScreen()
                            }
                            
                            Tab("Logs", systemImage: "book.pages") {
                                LogsScreen()
                            }
                            Tab("Profile", systemImage: "person") {
                                ProfileScreen()
                            }
                        }
                    } else {
                        TabView {
                            TherapyScreen()
                                .tabItem {
                                    Label("Theraphy", systemImage: "heart")
                                }
                            LogsScreen()
                                .tabItem {
                                    Label("Logs", systemImage: "book.pages")
                                }
                            ProfileScreen()
                                .tabItem {
                                    Label("Profile", systemImage: "person")
                                }
                        }
                        
                    }
                }
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
                            
                        case .termCondition:
                            TermsAndConditionScreen()
                        }
                    }
                )
            }
        }
        .tint(Color(Theme.primary500.rawValue))
        .environment(router)
        .environment(\.locale, .init(identifier: locale))
        .environment(settings)
        
    }
}

#Preview {
    ContentView()
}
