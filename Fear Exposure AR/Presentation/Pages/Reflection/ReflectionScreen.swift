//
//  ResultScreen.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 14/10/24.
//

import SwiftUI

struct ReflectionScreen: View {
    
    enum Field {
        case field
    }
    
    var phobiaId : Int
    var phobiaName : String
    var heartRate : [Double]
    var duration : Double
    
    @Environment(Router.self) private var router
    @State var viewModel = ReflectionViewModel()
    @FocusState private var focusedField: Field?
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack (alignment: .leading) {
                    Spacer()
                        .frame(height: 32)
                    Text ("What do you feel \(Text("during this session").bold())?")
                        .font(.body)
                    Spacer()
                        .frame(height: 16)
                    FormDuringSession(valueSelected: $viewModel.feelingBeforeSelected)
                    
                    Spacer()
                        .frame(height: 48)
                    
                    Text ("What do you feel \(Text("after this session").bold())?")
                        .font(.body)
                    Spacer()
                        .frame(height: 16)
                    FormAfterSession(
                        feelingAfterSelected: $viewModel.feelingAfterSelected
                    )
                    
                    
                    Spacer()
                        .frame(height: 48)
                    
                    Text("How do you feel now compared to before the therapy session began?")
                        .font(.body)
                        .bold()
                    Spacer()
                        .frame(height: 16)
                    
                    TextField("Answer Here", text: $viewModel.notes, axis: .vertical)
                        .lineLimit(5...10)
                        .focused($focusedField, equals: .field)
                        .textFieldStyle(.roundedBorder)
                        .multilineTextAlignment(.leading)
                    Spacer()
                        .frame(height: 48)
                    
                    Button(
                        action: {
                            viewModel.onSubmitData(phobiaId: phobiaId, phobiaName: phobiaName, heartRate: heartRate, duration: duration)
                            router.navigate(to: .complete)
                        },
                        label: {
                            Text ("Submit")
                                .font(.body)
                                .bold()
                                .frame(maxWidth: geometry.size.width)
                                .padding(.vertical, 6)
                        }
                    )
                    .buttonStyle(.borderedProminent)
                    .background(Color(Theme.background.rawValue))
                    .frame(maxWidth: .infinity)
                    .disabled(viewModel.feelingBeforeSelected == .unknown || viewModel.feelingAfterSelected == .unknown || viewModel.notes.isEmpty)
                    
                }
                .frame(maxWidth: geometry.size.width, alignment: .leading)
                .padding(.horizontal, 16)
                
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                    focusedField = nil
                }
            }
        }
        .navigationTitle("Session Reflection")
        .navigationBarTitleDisplayMode(.large)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    NavigationStack {
        ReflectionScreen(
            phobiaId : 0, phobiaName: "Arachnophobia Therapy", heartRate: [], duration: 0
        )
    }
    .environment(Router())
    .tint(Color(Theme.primary500.rawValue))
}
