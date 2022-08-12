import SwiftUI

// try fullscreencover for login view https://www.hackingwithswift.com/quick-start/swiftui/how-to-present-a-full-screen-modal-view-using-fullscreencover

struct ContentView: View {
    @State var userResponse: UserResponse?
    
    var body: some View {
        if let userResponse = userResponse {
            MovieListView(userResponse: userResponse).navigationTitle("Movies")
        } else {
            LoginView { newUserResponse in
                userResponse = newUserResponse
            }.padding()
        }
    }
}
