//
//  CustomInputView.swift
//  SwiftUI-00
//
//  Created by Yassine Benabbas on 27/06/2024.
//

import SwiftUI

struct CustomInputView: View {
    var text = "Hello World"
    @State private var textFieldContent = ""
    @Binding var isValidEmail: Bool
    let onSpecialEvent : (String) -> Void
    
    var body: some View {
        VStack {
            Text(text)
            TextField("Please enter something",
                      text: $textFieldContent)
            .border(.secondary)
            .padding()
            .onSubmit {
                isValidEmail = textFieldContent.contains("@")
            }
            .onChange(of: textFieldContent, perform: { newValue in 
                if textFieldContent.hasSuffix(".com") {
                    onSpecialEvent(textFieldContent)
                }
            })
            Text("text field content: \(textFieldContent)")
        }
        .border(.secondary)
        .padding()
    }
}


//struct MyView_Previews: PreviewProvider {
//    static var previews: some View {
//        @State var isValidEmail = false
//        CustomInputView(isValidEmail: $isValidEmail)
//    }
//}
//
//#Preview {
//    MyView_Previews()
//}

//#Preview("Custom view preiew 2") {
//    @State var isValidEmail = false
//    _ = CustomInputView(text: "Other preview", isValidEmail: $isValidEmail)
//}
