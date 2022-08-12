import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("Movie \(movie.title)")
                    Spacer()
                    Text(movie.metascore)
                }
                AsyncImage(url: URL(string: movie.poster))
                Text(movie.plot)
            }.padding()
        }
    }
}

struct Previews_MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let movie = Movie(title: "Titan A.E", released: "2000", director: "", actors: "", poster: "https://m.media-amazon.com/images/M/MV5BYWIzMWFjN2EtOWIwYS00Mzk5LWE0MjItMDU2YTczM2U0MGNiXkEyXkFqcGdeQXVyMjUzOTY1NTc@._V1_SX300.jpg", plot: "Earth is a memory of the past; it's the 31st Century and humanity is on the brink of total annihilation, all except for one young man who holds the map to the universe's last hope: Titan. In a race against time, the human race has to find the Titan before the illusive Drej destroy it.", metascore: "48")
        MovieDetailView(movie: movie)
    }
}
