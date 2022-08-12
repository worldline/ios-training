import SwiftUI

enum LoginState {
    case neutral, loading, success, failure
}

struct LoginView: View {
    @State private var login = ""
    @State private var password = ""
    @State private var loginState: LoginState = .neutral
    let onLoginSuccess: () -> Void
    
    var body: some View {
        VStack {
            Text("Please login")
            TextField("Enter your login", text: $login)
            SecureField("Enter your password", text: $password)
            HStack {
                Button("Login") { 
                    loginState = .loading 
                    
                }
                Button("Register") { 
                    loginState = .failure 
                    onLoginSuccess()
                }
            }.disabled(loginState == .loading)
            if loginState == .failure {
                Text("Operation failed").foregroundColor(.red)
            }
        }
        .textFieldStyle(.roundedBorder)
        .buttonStyle(.bordered)
    }
}
