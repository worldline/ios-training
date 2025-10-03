import Foundation

struct Pokemon: Identifiable {
    var id: String {
        get { name }
    }
    
    let name: String
    let url: String
    var imageUrl: URL? {
        get {
            let id = url.trimmingPrefix("/").split(separator: "/").last ?? "0"
            return URL(string:  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png")
        }
    }
}

let globalPokemons = [
    Pokemon(name:"bulbasaur",url:"https://pokeapi.co/api/v2/pokemon/1/"),
    Pokemon(name:"ivysaur",url:"https://pokeapi.co/api/v2/pokemon/2/")
]
