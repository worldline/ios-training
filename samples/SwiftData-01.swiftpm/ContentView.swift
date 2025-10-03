import SwiftUI
import SwiftData

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
    @Environment(\.modelContext) private var context
    @Query(sort: \Pokemon.name) private var pokemons: [Pokemon]
    var body: some View {
        VStack {
            NavigationSplitView {
                Button("Add pokemon") {
                    let p = Pokemon(name:"bulbasaur\(Int.random(in:0...1000))",url:"https://pokeapi.co/api/v2/pokemon/1/")
                    context.insert(p)
                    try? context.save()
                }
                List(pokemons) { pokemon in
                    NavigationLink {
                        PokemonDetailView(pokemon: pokemon)
                    } label: {
                        PokemonRow(pokemon: pokemon)
                    }
                }
            } detail: {
                Text("Select an Item")
            }
        }
    }
}

#Preview("Pokemon List", traits: .pokemonSampleData) {
    ContentView()
}
