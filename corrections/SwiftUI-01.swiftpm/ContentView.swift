import SwiftUI

struct ContentView: View {
    @EnvironmentObject var globalState: GlobalState
    @State var toggle = false
    @State var textFieldContent = ""
    @State var isEmailValid = false
    var body: some View {
        VStack {
            CustomInputView(text: "Custom Component", isValidEmail: $isEmailValid) { value in
                print(value)
            }
            TextField("Please enter something",
                      text: $textFieldContent)
            .border(.secondary)
            .padding()
            .onSubmit {
                print("submitted", textFieldContent)
            }
            Text("text field content: \(textFieldContent)")
            Text("Hello SwiftUI")
                .font(.largeTitle)
                .foregroundColor(isEmailValid ? .red : .green)
                .padding()
            Button(action: {
                toggle = !toggle
                print(isEmailValid)
                globalState.score = 20
            }) {
                HStack {
                    Image(systemName: "suit.heart.fill")
                        .foregroundColor(.red)
                    Text("I am a button")
                        .font(.headline)
                        .foregroundColor(.white)
                }
                .padding(12)
                .background(toggle ? Color.orange : Color.blue)
                .cornerRadius(8)
            }
        }
    }
}
