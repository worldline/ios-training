struct Movie {
    let title: String
    let released: String
    let director: String
    let actors: String
    let poster: String
    let plot: String
    let metascore: String
}

struct User: Codable {
    let id: Int
    let firstname: String
    let lastname: String
    let email: String
    let created_at: String
    let update_at: String
}

