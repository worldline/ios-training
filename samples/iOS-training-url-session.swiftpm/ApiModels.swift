struct Response: Codable {
    var results: [Track]
}

struct Track: Codable, Equatable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}
