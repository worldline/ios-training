import SwiftUI

struct MovieListView: View {
    let movies = [Movie(title: "a", released: "2000", director: "aa", actors: "b", poster: "z", plot: "a", metascore: "70")]
    var body: some View {
        List(movies, id: \.title){ movie in
            MovieItemView(movie: movie)
        }
    }
}
