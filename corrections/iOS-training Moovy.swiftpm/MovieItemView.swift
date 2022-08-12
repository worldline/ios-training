import SwiftUI


struct MovieItemView: View {
    let movie: Movie
    var body: some View {
        Text("Movie \(movie.title)")
    }
}
