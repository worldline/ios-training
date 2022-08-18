# Mini projet

Le dernier chapitre de cette formation vous demandera de créer une application SwiftUI à partir de zéro.

## Cahier des charges

L'application consiste en une application de recherche de films avec les fonctionnalités suivantes :

- Rechercher des films par titre.
- Afficher les détails du film sélectionné.
- L'application nécessite que l'utilisateur soit connecté.
- L'application permet à un nouvel utilisateur de s'enregistrer.
- L'écran de la liste des films permet de se déconnecter de l'application.
- L'application se souvient de l'utilisateur connecté après un redémarrage.
- L'application utilise [cette API](https://vue-js-backend.herokuapp.com/api-docs/#/) pour l'authentification et la recherche de films.
  - Le point de terminaison **/movies/search** nécessite de passer le jeton récupéré du point de terminaison **/user/login** ou **user/register** dans cet en-tête : `Authorization : Bearer \(userResponse.token)`
- (Facultatif) Le résultat des requêtes précédentes est mis en cache localement.
- (Facultatif) Animer la transition entre la vue de connexion et la vue de la liste des films ([tutorial](https://www.hackingwithswift.com/quick-start/swiftui/how-to-add-and-remove-views-with-a-transition)).

Un aperçu de l'application peut être vu ici.

<iframe
 width="720"
 height="576"
 src="https://www.youtube.com/embed/vh5AlaGK0Eo"
 title="Lecteur vidéo YouTube"
 frameborder="0"
 allow="accelerometer ; autoplay ; clipboard-write ; encrypted-media ; gyroscope ; picture-in-picture"
 allowfullscreen />

## Conseils

- Utiliser des *struct* par défaut
- Il existe de nombreuses techniques pour gérer le flux de la vue de connexion à la vue de la liste des films.
L'une d'entre elles consiste à s'appuyer sur un état enregistré.
Ce qui suit donne un aperçu de ce à quoi cela ressemble.

```swift
struct ContentView : View {
    @State var loggedIn : false
    
    var body : some View {
        if loggedIn {
            MovieListView()
        } else {
            // Le LoginView prend un callback qui est appelé lorsque la connexion est réussie
            LoginView { newLoggedIn in
                loggedIn = newLoggedIn
            }
        }
    }
}
```

- Dans la vue de connexion, utilisez un enum pour suivre l'état de l'opération de connexion afin de pouvoir désactiver le bouton de connexion lorsqu'une requête est en cours.

```swift
enum LoginState {
    case neutre, chargement, succès, échec
}
struct LoginView : View {
    @State private var loginState : LoginState = .neutral
    // autre code
}
```

- Utilisez un objet Task pour exécuter du code asynchrone.

```swift
Button("Connexion") { 
    loginState = .loading
    Task {
        if await login() {
            onLoginSuccess(true)
        }
    }
}
```

::: warning Swift Concurrency plante sur Swift Playground 
N'utilisez pas l'application Swift Playground pour exécuter votre application car elle ne fonctionne pas bien avec SwiftUI + Swift Concurrency (async, await et Task).
A la place, vous pouvez créer un projet Xcode de type Playground pour combiner la puissance de Xcode et la simplicité des projets Playground.
:::

- Utiliser le paquet Swift [DebouncedOnChange](https://github.com/Tunous/DebouncedOnChange) pour optimiser la recherche.
- Pour générer le code initial d'un aperçu, ouvrez une vue, puis utilisez la fonction Xcode *Editor -> Create preview*. 
- La vue `List` nécessite que vous spécifiez un champ `id` `List(movies, id : \.title)` ou que les éléments soient conformes au protocole Identifiable.
- Si vous ne pouvez pas ajouter les paquets SwiftPM à partir de Xcode, ajoutez-les en éditant le fichier *package.swift* à la main.
Voici un exemple ci-dessous.

@[code swift](../../../../corrections/iOS-training-Moovy.swiftpm/Package.swift)