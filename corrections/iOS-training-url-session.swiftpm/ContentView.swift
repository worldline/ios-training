import SwiftUI

struct ContentView: View {
    @State private var results = [Result]()
    @State private var isLoading = true
    
    var body: some View {
        if isLoading {
            ProgressView().task {
                if let response: Response  = try? await loadData() {
                    results = response.results
                }
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                isLoading = false
            }
        } else {
            List(results, id: \.trackId) { item in
                VStack(alignment: .leading) {
                    Text(item.trackName)
                        .font(.headline)
                    Text(item.collectionName)
                }
            }
        }
    }
}

enum MyError: Error {
    case UrlError
}
func loadData<T: Decodable>() async throws -> T  {
    guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
        print("Invalid URL")
        throw MyError.UrlError
    }
    let (data, _) = try await URLSession.shared.data(from: url)
    let decodedResponse = try JSONDecoder().decode(T.self, from: data)
    return decodedResponse
}
