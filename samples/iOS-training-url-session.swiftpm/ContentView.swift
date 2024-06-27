import SwiftUI

enum ContentViewState: Equatable {
    case loading
    case fail(String)
    case sucess([Track])
}

struct ContentView: View {
    @State private var currentState = ContentViewState.loading
    static var forceFail: Bool = true
    
    var body: some View {
        ZStack {
            switch currentState {
            case .loading:
                ProgressView().task {
                    try? await Task.sleep(nanoseconds: 1_000_000_000)
                    if let response: Response  = try? await loadData() {
                        currentState = .sucess(response.results)
                    } else {
                        currentState = .fail("Failed to load the data")
                    }
                }
            case .fail(let errorMessage):
                VStack {
                    Text(errorMessage).foregroundColor(.red)
                    Button("Reload") {
                        currentState = .loading
                    }
                }
            case .sucess(let results):
                List(results, id: \.trackId) { item in
                    VStack(alignment: .leading) {
                        Text(item.trackName)
                            .font(.headline)
                        Text(item.collectionName)
                    }
                }
            }
        }.animation(.default, value: currentState)
    }
}

enum MyError: Error {
    case UrlError
}
func loadData<T: Decodable>() async throws -> T  {
    let urlString = ContentView.forceFail ? "" : "https://itunes.apple.com/search?term=taylor+swift&entity=song"
    ContentView.forceFail = false
    guard let url = URL(string: urlString) else {
        print("Invalid URL", urlString)
        throw MyError.UrlError
    }
    let (data, _) = try await URLSession.shared.data(from: url)
    let decodedResponse = try JSONDecoder().decode(T.self, from: data)
    return decodedResponse
}
