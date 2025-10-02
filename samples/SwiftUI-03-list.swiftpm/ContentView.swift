import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            List(pokemons) { pokemon in
                HStack {
                    // AsyncImage(url: pokemon.imageUrl) or with placeholder
                    AsyncImage(url: pokemon.imageUrl) { image in
                        // Keep the downloaded image as is
                        image
                    } placeholder: {
                        // In case the image cannot be loaded
                        Image(systemName: "heart.fill")
                    }
                    Text(pokemon.name)
                }
            }
        }
    }
}
