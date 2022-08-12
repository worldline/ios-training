import SwiftUI
import KeychainAccess

// try fullscreencover for login view https://www.hackingwithswift.com/quick-start/swiftui/how-to-present-a-full-screen-modal-view-using-fullscreencover

struct ContentView: View {
    @State var userResponse: UserResponse? = loadUserResponse()
    
    var body: some View {
        if let localUserResponse = userResponse {
            NavigationView {
                MovieListView(userResponse: localUserResponse)
                    .navigationTitle("Movies")
                    .toolbar {
                        ToolbarItem(placement: .primaryAction) {
                            Button("Logout") {
                                userResponse = nil
                            }
                        }
                    }
            }
        } else {
            LoginView { newUserResponse in
                userResponse = newUserResponse
                if let userResponse = userResponse {
                    ContentView.saveUserResponse(userResponse: userResponse)
                }
            }.padding()
        }
    }
    
    static func saveUserResponse(userResponse: UserResponse){
        let keychain = Keychain(service: "com.example.moovy-token")
        do {
            let data = try JSONEncoder().encode(userResponse)
            if let jsonString = String(data: data, encoding: .utf8) {
                keychain["userResponse"] = jsonString
            }
        } catch {
            print("Failed to encode JSON")
        }
    }
    
    static func loadUserResponse() -> UserResponse? {
        let keychain = Keychain(service: "com.example.moovy-token")
        guard let data = keychain["userResponse"]?.data(using: .utf8) else {
            return nil
        }
        do {
            let decodedData = try JSONDecoder().decode(UserResponse.self, from: data)
            print(decodedData)
            return decodedData
        }
        catch {
            print("Failed to decode JSON")
        }
        return nil
    }
    
    static func removeUserResponse(){
        let keychain = Keychain(service: "com.example.moovy-token")
        keychain["userResponse"] = nil
    }
}
