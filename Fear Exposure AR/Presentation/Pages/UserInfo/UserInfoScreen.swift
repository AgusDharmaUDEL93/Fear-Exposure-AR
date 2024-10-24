//
//  UserInforScreen.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 21/10/24.
//

import SwiftUI

struct UserInfoScreen : View {
    
    enum Field {
        case name
        case age
    }
    @Environment(Router.self) private var router
    @State var viewModel = UserInfoViewModel()
    @FocusState private var focusedField: Field?

    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack (alignment: .leading) {
                    Text("Name")
                        .font(.body)
                        .bold()
                    
                    TextField("Your Name", text: $viewModel.name, axis: .vertical)
                        .focused($focusedField, equals: .name)
                        .textFieldStyle(.roundedBorder)
                        .multilineTextAlignment(.leading)
                    Spacer()
                        .frame(height: 48)
                    Text("Age")
                        .font(.body)
                        .bold()
                    TextField("Your Age", text: $viewModel.age, axis: .vertical)
                        .focused($focusedField, equals: .age)
                        .textFieldStyle(.roundedBorder)
                        .multilineTextAlignment(.leading)
                        .keyboardType(.numberPad)
                    Spacer()
                        .frame(height: 48)
                    HStack {
                        Text("Gender")
                            .font(.body)
                            .bold()
                        Spacer()
                        Picker("Your Gender", selection: $viewModel.gender) {
                            ForEach(viewModel.genders, id: \.self){
                                Text($0)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                    }
                   

                    Spacer()
                        .frame(height: 48)
                    
                    Button(action: {
                        router.navigate(to: .theraphyType)
                    }, label: {
                        Text("Done")
                            .frame(maxWidth: geometry.size.width)
                            .padding(.vertical, 6)
                            .foregroundStyle(Color(Theme.background.rawValue))
                            .bold()
                    })
                    .tint(Color(Theme.primary500.rawValue))
                    .buttonStyle(.borderedProminent)
                    
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
        .navigationTitle("User Info")
        .navigationBarTitleDisplayMode(.large)
    }
}


#Preview {
    NavigationStack {
        UserInfoScreen()
    }
    .tint(Color(Theme.primary500.rawValue))
    .environment(Router())
}
