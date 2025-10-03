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
        .task(id: query, debounceTime: .milliseconds(250)) {
            await searchMovies(query: query)
        }
        .task { // launch task on view load
            await searchMovies(query: query)
        }
    }
    
    func searchMovies(query: String) async{
        guard let url = URL(string: "\(BASE_API_URL)/movies/search?title=\(query)") else {
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


struct Previews_MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        let userResponse = UserResponse(user: User(id: 1, firstname: "", lastname: "", email: "", createdAt: "", updatedAt: ""), token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwiZW1haWwiOiJhQG1haWxpb3MuY29tIiwiZmlyc3RuYW1lIjoiSm9obiIsImxhc3RuYW1lIjoiRG9lIiwiY3JlYXRlZEF0IjoiMjAyMy0xMS0yOFQxNTo1NDo0OC42OTBaIiwidXBkYXRlZEF0IjoiMjAyMy0xMS0yOFQxNTo1NDo0OC42OTBaIiwiaWF0IjoxNzAxMjczNTkyLCJleHAiOjE3MDE4NzgzOTJ9.P5kmWFSVLtqoDVe0RR8D9tJ1BC9SDcsL7UDfH1-SgQc")
        NavigationView {
            MovieListView(userResponse: userResponse)
        }
    }
}
