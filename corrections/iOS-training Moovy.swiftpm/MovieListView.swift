import SwiftUI
import DebouncedOnChange

enum MovieListState {
    case neutral, loading, failure
}

struct MovieListView: View {
    @State var movies: [Movie] = []
    
    let userResponse: UserResponse
    
    @State private var query = "titanic"
    @State private var movieListState: MovieListState = .neutral
    
    var body: some View {
        NavigationView {
            List(movies, id: \.title){ movie in
                NavigationLink(movie.title, destination: MovieDetailView(movie: movie).navigationTitle(movie.title))
            }
            .navigationTitle("Movies")
            .searchable(text: $query)
            .onSubmit(of: .search) {
                Task {
                    await searchMovies(query: query)
                }
            }
            .onChange(of: query, debounceTime: 0.5) { newQuery in
                Task {
                    await searchMovies(query: newQuery)
                }
            }
            .task { // launch task on view load
                await searchMovies(query: query)
            }
        }
    }
    
    func searchMovies(query: String) async{
        guard let url = URL(string: "https://vue-js-backend.herokuapp.com/movies/search?title=\(query)") else {
            movieListState = .failure
            return
        }
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "accept")
        request.setValue("Bearer \(userResponse.token)", forHTTPHeaderField: "Authorization")
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            print(String(decoding: data, as: UTF8.self))
            movies = try JSONDecoder().decode([Movie].self, from: data)
        } catch {
            movieListState = .failure
        }
    }
}

struct MovieRowView: View {
    let movie: Movie
    var body: some View {
        Text("Movie \(movie.title)")
    }
}
