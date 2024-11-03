//
//  QuestionAsessement.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 31/10/24.
//

import SwiftUI

struct QuestionAsessement : View {
    
    let number : Int
    let question : String
    var options : [String]
    @State private var optionIndexSelected : Int = -1
    var onChangedSelectedOption : (Int) -> Void
    
    var body: some View {
        VStack {
            HStack (alignment : .top) {
                Text("\(number).")
                Spacer()
                    .frame(width: 12)
                Text(question)
                Spacer()
            }
            LazyVGrid (columns: [
                GridItem(.adaptive(minimum: 100)),
                GridItem(.adaptive(minimum: 100))
            ]){
                ForEach(0...(options.count - 1), id: \.self){ index in
                    AnswerAsessement(
                        label: options[index],
                        isSelected: Binding(get: {
                            optionIndexSelected == index
                        }, set: { value in
                        }),
                        onTapAnswer:  {
                            optionIndexSelected = index
                            onChangedSelectedOption(index)
                            print("Here")
                        }
                    )
                    
                }
                
            }
        
            
        }
        .frame(maxWidth : .infinity)
    }
}

#Preview {
    QuestionAsessement(
        number: 1,
        question: "How intense is your fear when exposed to the object?",
        options: [
            "1",
            "2",
            "3",
            "4"
        ],
        onChangedSelectedOption: {_ in
            
        }
    )
        .padding(16)
}
