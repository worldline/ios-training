import SwiftUI

struct PokemonDetailView : View {
    let pokemon: Pokemon
    var body: some View {
        VStack {
            Text(pokemon.name)
            AsyncImage(url: pokemon.imageUrl)
            Text("Details: \(pokemon.url)")
        }
    }
}

#Preview {
    PokemonDetailView(pokemon: Pokemon.sampleData.first!)
}
