import SwiftUI

@main
struct MyApp: App {
    @State var completedVisit = UserDefaults.standard.bool(forKey: "FirstVisitCompleted")
    var body: some Scene {
        WindowGroup {
            if completedVisit {
                ContentView()
            } else {
                FirstVisitView(completed: $completedVisit)
            }
        }
    }
}
