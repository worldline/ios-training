//
//  CustomInputView.swift
//  SwiftUI-00
//
//  Created by Yassine Benabbas on 27/06/2024.
//

import SwiftUI

struct CustomInputView: View {
    @EnvironmentObject var globalState: GlobalState
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
            Text("text field content: \(textFieldContent) - \(globalState.score)")
        }
        .border(.secondary)
        .padding()
    }
}


struct CustomInputViewPreviewProvider: PreviewProvider {
    @StateObject static var globalState = GlobalState()
    @State static var isValidEmail = false
    static var previews: some View {
        CustomInputView(isValidEmail: $isValidEmail) { value in
            print(value)
        }.previewInterfaceOrientation(.landscapeRight)
            .environmentObject(globalState)
    }
}


struct CustomInputViewPreview: View {
    @StateObject var globalState = GlobalState()
    @State var isValidEmail = false
    var text = ""
    var body: some View {
        CustomInputView(text: text, isValidEmail: $isValidEmail) { value in
            print(value)
        }.environmentObject(globalState)
    }
}

#Preview() {
    CustomInputViewPreview()
}

#Preview("Other custom preview") {
    CustomInputViewPreview(text: "Other preview")
}
