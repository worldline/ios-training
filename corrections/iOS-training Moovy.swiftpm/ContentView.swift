import SwiftUI

// try fullscreencover for login view https://www.hackingwithswift.com/quick-start/swiftui/how-to-present-a-full-screen-modal-view-using-fullscreencover

struct ContentView: View {
    @State var loggedIn = false
    
    var body: some View {
        NavigationView {
            VStack{
                NavigationLink(destination: MovieListView().navigationTitle("Movies"), isActive: $loggedIn) {
                    EmptyView()
                }.hidden()
                LoginView { userResponse in
                    loggedIn = true
                }.padding()
            }
        }
    }
}
