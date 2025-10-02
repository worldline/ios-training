import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationSplitView {
                List(pokemons) { pokemon in
                    NavigationLink {
                        PokemonDetailView(pokemon: pokemon)
                    } label: {
                        HStack {
                            AsyncImage(url: pokemon.imageUrl) { image in
                                image
                            } placeholder: {
                                Image(systemName: "heart.fill")
                            }
                            Text(pokemon.name)
                        }
                    }
                }
            } detail: {
                Text("Select an Item")
            }
        }
    }
}
