import SwiftUI

struct PokemonRow: View {
    let pokemon: Pokemon
    var body: some View {
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

struct ContentView: View {
    @State var searchText = ""
    @State var pokemons = globalPokemons
    var body: some View {
        VStack {
            NavigationSplitView {
                List(pokemons) { pokemon in
                    NavigationLink {
                        PokemonDetailView(pokemon: pokemon)
                    } label: {
                        PokemonRow(pokemon: pokemon)
                    }
                }.searchable(text:$searchText).onChange(of: searchText) { oldValue, newValue in
                    pokemons = pokemons.filter { p in
                        p.name.lowercased().contains(searchText.lowercased())
                    }
                }
            } detail: {
                Text("Select an Item")
            }
        }
    }
}

#Preview {
    ContentView()
}
