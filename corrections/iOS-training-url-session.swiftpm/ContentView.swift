import SwiftUI

struct ContentView: View {
    @State private var results = [Result]()
    @State private var isLoading = true
    
    var body: some View {
        if isLoading {
            ProgressView().task {
                await loadData(items: results)
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

func loadData() async -> [Result] {
    guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
        print("Invalid URL")
        return []
    }
    
    do {
        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedResponse = try JSONDecoder().decode(Response.self, from: data)
        return decodedResponse.results
    } catch {
        print("Invalid data")
    }
    return []
}
