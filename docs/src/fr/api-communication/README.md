# Communiquer avec une API REST

::: tip Temps estimé
1/4 journée
:::

## Quelques concepts utiles

Communiquer avec une API REST repose sur plusieurs concepts que nous allons aborder brièvement ci-dessous :

- [JSON](https://www.json.org/json-en.html) : format standard d'échange de données très utilisé dans les messages HTTP des API REST.
- [REST API](https://www.redhat.com/en/topics/api/what-is-a-rest-api) : il s'agit d'une interface de communication standard entre un client et un serveur qui est conforme aux contraintes du style architectural REST. Dans une API REST, les messages HTTP sont sans état et utilisent le format de données JSON.
- [Messages HTTP](https://developer.mozilla.org/en-US/docs/Web/HTTP/Messages) : un message HTTP est un message textuel qui contient différentes parties. Un message peut être soit une requête ou une réponse. Une requête est le message HTTP que le client envoie au serveur et la réponse est le message HTTP que le serveur envoie au client en réaction à la requête. Les requêtes et les réponses comportent une partie appelée *corps*. Dans les API REST, le corps est généralement formaté en JSON.
- [Codable](https://developer.apple.com/documentation/swift/codable) : c'est un type qui peut se convertir vers et depuis d'une représentation externe. Il est équivalent à `Serializable` en Java. Ce type est utile si l'on veut convertir un objet en une chaîne JSON et vice-versa.
- `async` et `await` : ces mots-clés sont utilisés pour appeler une fonction asynchrone en utilisant un mode de codage synchrone. Cela signifie que les callbacks ne sont plus nécessaires ! Ils font partie intégrante de la programmation concurrente en Swift (Swift Concurrency).
- [URLSession](https://developer.apple.com/documentation/foundation/urlsession) : Le client HTTP officiel d'iOS qui fait partie de la bibliothèque Foundation. Cette bibliothèque ne fait pas partie de la bibliothèque standard de Swift, mais il existe une implémentation pour les plateformes non-Apple appelée [swift-corelibs-foundation](https://github.com/apple/swift-corelibs-foundation).

## TP : appel d'une API REST

Ce TP vous propose de suivre [l'excellent tutoriel de hackingwithswift](https://www.hackingwithswift.com/books/ios-swiftui/sending-and-receiving-codable-data-with-urlsession-and-swiftui).
Il vous explique comment récupérer des données JSON à partir de [l'API d'iTunes](https://itunes.apple.com/search?term=taylor+swift&entity=song).
Vous trouverez ci-dessous un extrait du corps de la réponse.

```json
{
   "resultCount":50,
   "results" :[
      {
         "wrapperType" : "track",
         "kind" : "song",
         "artistId":159260351,
         "collectionId":1440913923,
         "trackId":1440914010,
         "artistName" : "Taylor Swift",
         "collectionName" : "Taylor Swift (Bonus Track Version)",
         "trackName" : "Notre chanson",
         "collectionCensoredName" : "Taylor Swift (Bonus Track Version)",
      }
   ]
}
```