struct UserResponse: Codable, Equatable {
    static func == (lhs: UserResponse, rhs: UserResponse) -> Bool {
        lhs.token == rhs.token && lhs.user.email == rhs.user.email
    }
    
    let user: User
    let token: String
}

struct RegistrationRequest: Codable {
    let email: String
    let password: String
    let firstname: String
    let lastname: String
}

struct LoginRequest: Codable {
    let email: String
    let password: String
}
