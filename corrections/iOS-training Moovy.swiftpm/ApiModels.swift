struct UserResponse: Codable {
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
