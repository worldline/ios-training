import SwiftUI


// try fullscreencover for login view https://www.hackingwithswift.com/quick-start/swiftui/how-to-present-a-full-screen-modal-view-using-fullscreencover

struct ContentView: View {
    @State var userResponse: UserResponse? = KeychainUtils.loadUserResponse()
    
    var body: some View {
        if let localUserResponse = userResponse {
            NavigationView {
                MovieListView(userResponse: localUserResponse)
                    .navigationTitle("Movies")
                    .toolbar {
                        ToolbarItem(placement: .primaryAction) {
                            Button("Logout") {
                                withAnimation {
                                    userResponse = nil
                                }
                                KeychainUtils.removeUserResponse()
                            }
                        }
                    }
            }.transition(.move(edge: .bottom))
        } else {
            LoginView { newUserResponse in
                withAnimation {
                    userResponse = newUserResponse
                }
                if let userResponse = userResponse {
                    KeychainUtils.saveUserResponse(userResponse: userResponse)
                }
            }.padding()
        }
    }
}
