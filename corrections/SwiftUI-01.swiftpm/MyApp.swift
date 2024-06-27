import SwiftUI

class GlobalState: ObservableObject {
    @Published var score = 0
}

@main
struct MyApp01: App {
    @StateObject var globalState = GlobalState()
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
