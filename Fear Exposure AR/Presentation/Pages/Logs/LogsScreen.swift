//
//  LogsScreen.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 05/11/24.
//

import SwiftUI

struct LogsScreen : View {
    
    @State var viewModel : LogsViewModel = LogsViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                TitleScreen(
                    title: "Session Log",
                    description: "Description of this screen and its purpose."
                )
                ScrollView {
                    
                    VStack (alignment: .leading) {
                        Spacer()
                            .frame(maxWidth: geometry.size.width)
                        
                        if (viewModel.log.isEmpty){
                            
                        } else {
                            ForEach(viewModel.log, id: \.logId){ log in
                                
                                CardLog(
                                    phobiaName: "\(log.phobiaName ?? "") Therapy",
                                    feeling: .terrified,
                                    notes: log.notes,
                                    heartRate: log.heartRate.isEmpty ? -1 : (log.heartRate.reduce(0, +)/Double(log.heartRate.count)),
                                    duration: log.duration,
                                    date: log.dateTime
                                )
                                
                                Spacer()
                                    .frame(height: 16)
                            }
                        }
                        
                        
                        
                        
                        
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 16)
                    Spacer()
                        .frame(height: 110)
                }
            }
            
        }
        .onAppear{
            viewModel.getAllLog()
        }
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
