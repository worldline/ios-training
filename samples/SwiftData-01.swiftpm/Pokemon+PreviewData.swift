import Foundation
import SwiftUI
import SwiftData

extension Pokemon {
    @MainActor static let sampleData = [
        Pokemon(name:"bulbasaur",url:"https://pokeapi.co/api/v2/pokemon/1/"),
        Pokemon(name:"ivysaur",url:"https://pokeapi.co/api/v2/pokemon/2/")
    ]
}


struct PokemonSampleData: PreviewModifier {
    static func makeSharedContext() async throws -> ModelContainer {
        let container = try ModelContainer(for: Pokemon.self, configurations: .init(isStoredInMemoryOnly: true))
        Pokemon.sampleData.forEach { container.mainContext.insert($0) }
        return container
    }
    
    func body(content: Content, context: ModelContainer) -> some View {
        content.modelContainer(context)
    }
}

extension PreviewTrait where T == Preview.ViewTraits {
    @MainActor static var pokemonSampleData: Self = .modifier(PokemonSampleData())
}
