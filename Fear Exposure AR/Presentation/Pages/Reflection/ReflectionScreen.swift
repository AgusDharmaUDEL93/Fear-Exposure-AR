//
//  ResultScreen.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 14/10/24.
//

import SwiftUI

struct ReflectionScreen: View {
    
    enum Field {
        case before
        case after
    }
    
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
                    
                    TextField("Answer Here", text: $viewModel.beforeText, axis: .vertical)
                        .lineLimit(5...10)
                        .focused($focusedField, equals: .before)
                        .textFieldStyle(.roundedBorder)
                        .multilineTextAlignment(.leading)
                    Spacer()
                        .frame(height: 48)
                   
                    Button(action: {
                       
                    }, label: {
                        Text ("Submit")
                            .font(.body)
                            .bold()
                            .frame(maxWidth: geometry.size.width)
                            .padding(.vertical, 6)
                    })
                    .buttonStyle(.borderedProminent)
                    .background(Color(Theme.background.rawValue))
                    .frame(maxWidth: .infinity)
                    
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
        ReflectionScreen()
    }
    .environment(Router())
    .tint(Color(Theme.primary500.rawValue))
}
