import SwiftUI

enum LoginState {
    case neutral, loading, success, failure
}

struct LoginView: View {
    @State private var email = "a@mailios.com"
    @State private var password = "12345678"
    @State private var loginState: LoginState = .neutral
    let onLoginSuccess: (UserResponse) -> Void
    
    var body: some View {
        VStack {
            Text("Please login")
            TextField("Enter an email", text: $email)
            SecureField("Enter a password", text: $password)
            HStack {
                Button("Login") { 
                    loginState = .loading
                    Task {
                        if let userResponse = await callLogin() {
                            onLoginSuccess(userResponse)
                        }
                    }
                }
                Button("Register") { 
                    loginState = .loading
                    Task {
                        if let userResponse = await callRegister() {
                            onLoginSuccess(userResponse)
                        }
                    }
                }
            }.disabled(loginState == .loading)
            if loginState == .failure {
                Text("Operation failed").foregroundColor(.red)
            }
        }
        .textFieldStyle(.roundedBorder)
        .buttonStyle(.bordered)
    }
    
    func callLogin() async -> UserResponse? {
        do {
            let encoded = try JSONEncoder().encode(LoginRequest(email: email, password: password))
            return try await callServer("user/login", requestBody: encoded)
        } catch {
            print("error: \(error)")
            loginState = .failure
        }
        return nil
    }
    
    func callRegister() async -> UserResponse? {
        do {
            let encoded = try JSONEncoder().encode(
                RegistrationRequest(email: email, password: password, firstname: "John", lastname: "Doe")
            )
            print(String(decoding: encoded, as: UTF8.self))
            return try await callServer("user/register", requestBody: encoded)
        } catch {
            print("error: \(error)")
            loginState = .failure
        }
        return nil
    }
    
    func callServer(_ path: String, requestBody: Data) async throws -> UserResponse? {
        guard let url = URL(string: "\(BASE_API_URL)/\(path)") else {
            loginState = .failure
            return nil
        }
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "accept")
        request.httpMethod = "POST"
        
        let (data, response) = try await URLSession.shared.upload(for: request,from: requestBody)
        print("response code", (response as? HTTPURLResponse)?.statusCode ?? -1, "response data", String(decoding: data, as: UTF8.self))
        return try JSONDecoder().decode(UserResponse.self, from: data)
    }
}
