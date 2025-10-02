import SwiftUI

struct ContentView: View {
    @State var date: Date = Date()
    var body: some View {
        VStack {
            Text("The selected Date in view is: \(date)")
            DateInputView(date: $date)
        }
    }
}
