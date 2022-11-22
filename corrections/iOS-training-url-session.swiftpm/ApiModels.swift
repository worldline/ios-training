struct Response: Codable {
    var results: [Result]
}

struct Result: Codable, Equatable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}
