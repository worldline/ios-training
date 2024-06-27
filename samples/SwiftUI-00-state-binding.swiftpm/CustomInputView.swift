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

struct CustomInputViewPreviewProvider: PreviewProvider {
    @State static var isValidEmail = false
    static var previews: some View {
        CustomInputView(isValidEmail: $isValidEmail) { value in
            print(value)
        }.previewInterfaceOrientation(.landscapeRight)
    }
}


struct CustomInputViewPreview: View {
    @State var isValidEmail = false
    var text = ""
    var body: some View {
        CustomInputView(text: text, isValidEmail: $isValidEmail) { value in
            print(value)
        }
    }
}

#Preview() {
    CustomInputViewPreview()
}

#Preview("Other custom preview") {
    CustomInputViewPreview(text: "Other preview")
}
