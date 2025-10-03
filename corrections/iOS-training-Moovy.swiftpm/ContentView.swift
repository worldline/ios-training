import SwiftUI


// try fullscreencover for login view https://www.hackingwithswift.com/quick-start/swiftui/how-to-present-a-full-screen-modal-view-using-fullscreencover

struct ContentView: View {
    @State var userResponse: UserResponse? = KeychainUtils.loadUserResponse()
    
    var body: some View {
        if let localUserResponse = userResponse {
            NavigationSplitView {
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
            } detail: {
                Text("Movie list")
            }.transition(.move(edge: .bottom))
        } else {
            LoginView(userResponse: $userResponse.animation()).onChange(of: userResponse, { oldValue, newValue in
                if let newValue {
                    KeychainUtils.saveUserResponse(userResponse: newValue)
                }
            })
        }
    }
}
