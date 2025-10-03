import Foundation
import SwiftUI
import SwiftData

@Model class Pokemon: Identifiable {
    var id: String {
        get { name }
    }
    
    var name: String
    var url: String
    var imageUrl: URL? {
        get {
            let id = url.trimmingPrefix("/").split(separator: "/").last ?? "0"
            return URL(string:  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png")
        }
    }
    
    init(name: String, url: String) {
        self.name = name
        self.url = url
    }
}
