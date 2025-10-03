import SwiftUI

struct FirstVisitView : View {
    @Binding var completed: Bool
    var body : some View {
        VStack {
            Text("Welcome to this awesome App")
            HStack {
                Spacer()
                Button {
                    completed = true
                    UserDefaults.standard.set(true, forKey: "FirstVisitCompleted")
                } label: {
                    Text("Close").border(.primary)
                }
            }            
        }
    }
}

#Preview {
    @Previewable @State var completed = false
    FirstVisitView(completed: $completed)
}
