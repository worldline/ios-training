# Persistance locale des données

::: conseil Temps estimé
1/4 journée
:::

La persistance locale des données consiste à conserver les données de l'application après que celle-ci ait été tuée et que les variables aient été retirées de la mémoire.
Les données persistantes offrent de nombreux avantages.
Nous pouvons les utiliser pour afficher les données initiales lorsque l'application démarre et attend que le premier lot de données soit récupéré depuis le serveur.
Elles peuvent également être utilisées pour permettre une utilisation hors ligne de l'application.

::: warning iOS isole les données d'application
Pour des raisons de sécurité, chaque application est isolée du reste des applications.
C'est ce qu'on appelle le *sandboxing* ou *bac à sable*.
[Cet article](https://medium.com/@dinesh.kachhot/different-ways-to-share-data-between-apps-de75a0a46d4a) montre les différentes façons permettant à deux ou plusieurs applications de partager leurs données.
:::

Il existe de nombreuses façons de persister des données dans SwiftUI que nous couvrons ci-dessous.

## UserDefaults

Il s'agit d'un stockage clé-valeur très simple qui persiste les données dans un fichier. 
La surface de l'API est très petite et le développeur n'a pas besoin de gérer le fichier persisté. 
Cela rend cette technique très efficace pour les cas d'utilisation de stockage simple. 
Vous trouverez un petit [guide ici](https://www.hackingwithswift.com/books/ios-swiftui/storing-user-settings-with-userdefaults). 

Voici un exemple de code qui montre comment faire persister et charger des données.

```swift
UserDefaults.standard.set(self.tapCount, forKey : "Tap")
@State private var tapCount = UserDefaults.standard.integer(forKey : "Tap")
```

## Codable enregistré dans un fichier

Une technique plus avancée et plus puissante consiste à charger manuellement et à faire persister un Codable dans un fichier. 
Cette technique est utile si vous voulez stocker des objets complexes (comme l'état ou le modèle) dans un fichier JSON.
Il y a deux étapes dans ce processus, la première consiste à décoder / encoder l'objet de / en JSON en utilisant `JSONDecoder().decode` et `JSONEncoder().encode`.
La deuxième étape consiste à charger / sauvegarder les données encodées et nous pouvons penser à deux façons d'y parvenir.
La première consiste à utiliser les méthodes de `UserDefaults`; `dataForKey:` pour charger les données et `setObject:ForKey` pour les enregistrer.
La deuxième façon consiste à créer et gérer un fichier manuellement en utilisant des API de fichier telles que `fileHandle.availableData` pour charger les données depuis un fichier et `data.write` pour les sauvegarder.

## Bibliothèques sophistiquées de persistance des données

Pour stocker des données dans une base de données ou de manière similaire, SQLite est disponible en tant que bibliothèque de bas niveau.
Il n'est pas recommandé de l'utiliser à moins qu'il n'y ait un fort souci de performance.
Il est plutôt recommandé d'utiliser des bibliothèques spécialisées dans la persistance des données.
Certaines peuvent être assimilées à une bibliothèque ORM (Object Relational Mapper).
Le reste de cette section décrit certaines d'entre elles.

::: warning Faites attention aux prix du stockage Cloud
Les bases de données sophistiquées proposent généralement un stockage dans le nuage pour fournir une offre complète.
Si vous êtes intéressé par le stockage de données dans le nuage, prenez le temps de lire la page de tarification afin d'éviter toute mauvaise surprise lorsque votre application sera en production.
:::

### Core Data

[Core Data](https://developer.apple.com/documentation/coredata) est une librairie fournie par Apple pour "Persister ou mettre en cache des données sur un seul appareil, ou synchroniser des données sur plusieurs appareils avec CloudKit".
Elle existe depuis iOS 3 et Apple la met continuellement à jour pour qu'elle reste pertinente.
Elle a la réputation d'avoir une courbe d'apprentissage abrupte, mais elle reste célèbre parmi les développeurs.

La librairie Code Data fonctionne de manière similaire à un ORM où les classes sont mappées en tableaux.
Xcode fournit un éditeur graphique qui permet de spécifier les tables, les relations et de générer le code nécessaire (en Swift ou Objective-C).

![Editeur Core Date](https://docs-assets.developer.apple.com/published/fbb9767e96/rendered2x-1622022015.png)

Même si Core Date existait avant SwiftUI, Apple a fait en sorte que les deux puissent être utilisés ensemble.
Cet article montre [comment utiliser Core Data dans un projet SwiftUI](https://www.hackingwithswift.com/books/ios-swiftui/how-to-combine-core-data-and-swiftui).

### Realm

[Realm](https://realm.io/) est considéré comme une alternative à Core Data car ils semblent fournir une liste similaire de fonctionnalités.
Plus particulièrement, la possibilité de stocker des données localement ou dans le nuage.
Les points où Realm gagne sont que la bibliothèque semble plus simple à apprendre et à utiliser et qu'elle est également disponible sous Android.

### Firebase datastore (ou tout autre stockage dans le nuage)

Contrairement à Realm et Core Data, qui sont des bases de données locales avec le stockage en nuage en option, Firebase Datastore est une base de données dans le nuage.
Cela signifie que Firebase Datastore nécessite une connexion Internet pour stocker et charger les données.
Cependant, la bibliothèque est simple à utiliser et prend en charge les mises à jour en temps réel.

::: tip
Firebase Datastore fait partie d'une plus grande suite de services appelée Firebase.
Parmi eux, nous trouvons *Firebase App Distribution*, qui permet de déployer et distribuer des applications sans avoir à utiliser TestFlight.
:::

## TP : compléter le tutoriel officiel d'iOS sur la persistance des données

Ce TP montre comment sauvegarder un codable dans un fichier géré manuellement en utilisant l'encodeur JSON et les API du système de fichiers.

[https://developer.apple.com/tutorials/app-dev-training/persisting-data](https://developer.apple.com/tutorials/app-dev-training/persisting-data)
