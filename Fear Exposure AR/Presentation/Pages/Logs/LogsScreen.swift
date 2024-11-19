//
//  LogsScreen.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 05/11/24.
//

import SwiftUI

struct LogsScreen : View {
    
    @State var viewModel : LogsViewModel = LogsViewModel()
    @Environment(Router.self) var router
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                TitleScreen(
                    title: "Session Log",
                    description:  "Review your previous session reflections"
                )
                if (viewModel.log.isEmpty){
                    VStack (alignment: .center) {
                        Spacer()
                        Text("No Data Logs")
                        Spacer()
                    }
                    .frame(maxWidth: geometry.size.width)
                } else {
                    
                    ScrollView {
                        
                        VStack (alignment: .leading) {
                            Spacer()
                                .frame(maxWidth: geometry.size.width)
                            
                            ForEach(viewModel.log, id: \.logId){ log in
                                
                                CardLog(
                                    phobiaName:  "\((viewModel.getPhobiaById(id: log.phobiaId ?? 0)?.name ?? ""))",
                                    feeling: .terrified,
                                    notes: log.notes,
                                    heartRate: log.heartRate.isEmpty ? -1 : (log.heartRate.reduce(0, +)/Double(log.heartRate.count)),
                                    duration: log.duration,
                                    image: viewModel.getPhobiaById(id: log.phobiaId ?? 0)?.image_nobg ?? "",
                                    date: log.dateTime,
                                    action: {
                                        if let logId = log.logId {
                                            router.navigate(to: .detailResult(id: logId))
                                        }
                                       
                                    }
                                )
                                
                                Spacer()
                                    .frame(height: 16)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 16)
                        Spacer()
                            .frame(height: 110)
                    }
                }
            }
            
        }
        .onAppear{
            viewModel.getAllLog()
        }
        .alert(
            "Error",
            isPresented: Binding(
                get: {
                    viewModel.errorMessage != nil
                },
                set: { _ in
                    
                }
            ),
            actions: {
                Button(
                    role: .cancel,
                    action: {
                        viewModel.clearErrorMessage()
                    },
                    label: {
                        Text("Okay")
                    }
                )
            },
            message: {
                Text(viewModel.errorMessage ?? "Unexpected Error Occured")
            }
        )
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationStack {
        LogsScreen()
    }
    .tint(Color(Theme.primary500.rawValue))
    .environment(Router())
}
