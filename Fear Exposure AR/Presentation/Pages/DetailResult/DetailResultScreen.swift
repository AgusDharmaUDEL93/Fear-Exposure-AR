//
//  DetailResultScreen.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 11/11/24.
//

import SwiftUI

struct DetailResultScreen : View {
    
    var id : UUID
    
    @Environment(Router.self) var router
    @State var viewModel = DetailResultViewModel()
    
    var body: some View {
        ScrollView {
            HStack {
                Text(viewModel.log.feelingDuring.getEmoji())
                    .font(.system(size: 48))
                Spacer()
                    .frame(width: 16)
                VStack (alignment:.leading, spacing: 8) {
                    
                    
                    Text ("Feeling \( Text(LocalizedStringKey(viewModel.log.feelingDuring.getLabel()) ) )")
                        .font(.title3)
                        .bold()
                    HStack {
                        Image(systemName: "pawprint.fill")
                        Spacer()
                            .frame(width: 8)
                        Text("\(viewModel.phobia.name) Therapy")
                    }
                    .foregroundStyle(Color(Theme.primary500.rawValue))
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(Color(Theme.primary100.rawValue))
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                    
                    HStack (alignment : .top) {
                        Image(systemName: "calendar")
                            .font(.subheadline)
                        Spacer()
                            .frame(width: 8)
                        Text ("Session Date: \(viewModel.log.dateTime.formatted(date: .long, time: .omitted)), \(viewModel.log.dateTime.formatted(date: .omitted, time: .shortened))")
                            .font(.subheadline)
                    }
                    .foregroundStyle(.gray)
                    
                    HStack (alignment : .top) {
                        Image(systemName: "clock")
                            .font(.subheadline)
                        Spacer()
                            .frame(width: 8)
                        Text ("Duration: \( Int(viewModel.log.duration/60) ) Minutes \( Int(viewModel.log.duration) % 20) Seconds")
                            .font(.subheadline)
                    }
                    .foregroundStyle(.gray)
                    
                }
            }
            Spacer()
                .frame(height: 48)
            VStack (alignment : .leading, spacing: 8) {
                Text("Note")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                Text(viewModel.log.notes)
                    .font(.body)
                    .bold()
                Spacer()
                    .frame(maxWidth: .infinity)
            }
            Spacer()
                .frame(height: 48)
            VStack (alignment :.leading, spacing: 16) {
                Text("Heart Rate")
                    .font(.title3)
                    .bold()
                VStack {
                    LazyVGrid (columns: [
                        GridItem(.adaptive(minimum: 100)),
                        GridItem(.adaptive(minimum: 100)),
                        GridItem(.adaptive(minimum: 100))
                    ]) {
                        VStack (alignment : .leading) {
                            Text("Lowest")
                                .font(.caption)
                                .foregroundStyle(.gray)
                            Text("\( NSString ( format : "%.1f", ( viewModel.log.heartRate.min() ?? 0 ) ) ) BPM")
                                .font(.body)
                                .bold()
                        }
                        VStack (alignment : .leading) {
                            Text("Highest")
                                .font(.caption)
                                .foregroundStyle(.gray)
                            Text("\( NSString ( format : "%.1f", (  viewModel.log.heartRate.max() ?? 0 )  )) BPM")
                                .font(.body)
                                .bold()
                        }
                        VStack (alignment : .leading) {
                            Text("Average")
                                .font(.caption)
                                .foregroundStyle(.gray)
                            if (viewModel.log.heartRate.isEmpty){
                                Text("0.0 BPM")
                                    .font(.body)
                                    .bold()
                            } else {
                                Text("\(NSString( format : "%.1f", ( viewModel.log.heartRate.reduce(0, +)/Double(viewModel.log.heartRate.count) )) ) BPM")
                                    .font(.body)
                                    .bold()
                            }
                            
                        }
                    }
                    Spacer()
                        .frame(height: 32)
                    LineGraphView(heartRateData: $viewModel.log.heartRate)
                        .frame(width: .infinity, height: 150)
                }
                .frame(maxWidth: .infinity)
                .padding(16)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .background{
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.black.opacity(0.1), lineWidth: 1)
                }
            }
        }
        .padding(16)
        .navigationTitle("Session Detail")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar{
            ToolbarItem (placement : .topBarLeading) {
                Button(action: {
                    router.navigateToRoot()
                }, label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                })
                .buttonStyle(.plain)
            }
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
        .onAppear{
            viewModel.getLogById(id: id)
        }
    }
        
    
}

#Preview {
    NavigationStack {
        DetailResultScreen(id : UUID())
    }
    .environment(Router())
}
