# Swift (partie 2)

::: tip Temps estimé
1/2 journée
:::

## Caractéristiques de la programmation orientée objet

Swift supporte la plupart des fonctionnalités de la *Programmation Orientée Objet* :

- Les classes peuvent être instanciées en objets.
  - Les constructeurs et les destructeurs sont appelés respectivement initialisateurs et désinitialisateurs.
- Encapsulation et [4 niveaux de contrôle d'accès](https://docs.swift.org/swift-book/LanguageGuide/AccessControl.html) qui vont de privé à public.
- Héritage simple des classes. L'héritage multiple des classes n'est pas supporté.
 - L'héritage permet à une classe d'utiliser les caractéristiques d'une autre.
- Surcharge des méthodes et [polymorphisme](https://levelup.gitconnected.com/polymorphism-in-swift) et contrôle d'accès.
- Surcharge des opérateurs et des fonctions, [composition](https://www.avanderlee.com/swift/composition-inheritance-code-architecture/).
- Les méthodes et propriétés statiques sont prises en charge.
- Les types génériques sont pris en charge.
- *Protocoles* qui sont l'équivalent des *Interfaces*.
  - Les classes et les structures peuvent se conformer à plusieurs protocoles.
  - Les protocoles peuvent avoir des [types associés](https://www.hackingwithswift.com/articles/74/understanding-protocol-associated-types-and-their-constraints), ce qui est similaire aux types génériques.
  - Ils sont beaucoup utilisés par les développeurs de Swift au point qu'il existe une technique de programmation appelée **Protocol oriented programming**.

Voici quelques fonctionnalités supplémentaires intéressantes : 

- Les extensions permettent d'ajouter des fonctions et de se conformer à des protocoles supplémentaires en dehors de la déclaration originale de la classe, de la structure ou du protocole. Ceci a de nombreuses utilisations qui simplifient notre code et voici quelques exemples.
  - Elles peuvent ajouter des méthodes aux classes de n'importe quelle bibliothèque que nous pouvons utiliser.
  - Elles peuvent définir des implémentations par défaut dans les protocoles.
- Les classes abstraites ne sont pas disponibles

[Ce code](https://swiftfiddle.com/05f4d4d3c8235299a875e08dcb3992f8) illustre certaines des caractéristiques évoquées plus haut.

En plus des classes, les structures dans Swift sont très puissantes et offrent des fonctionnalités similaires à celles des classes, à quelques exceptions près.

## Les structs

En Swift, les structs ont de nombreuses caractéristiques similaires aux classes.
Elles supportent les propriétés, les méthodes, les [subscripts](https://docs.swift.org/swift-book/LanguageGuide/Subscripts.html), les initialisateurs, les extensions et la conformité aux protocoles.
Les fonctionnalités qui ne sont disponibles que dans les classes [sont les suivantes](https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html) :

- Héritage.
- Le casting de type (permet de vérifier et d'interpréter le type d'une instance de classe au moment de l'exécution).
- Désinitialiseurs.
- Les structs sont passés par valeur tandis que les classes sont passées par référence.

[Cet extrait de code](https://swiftfiddle.com/d72ea73dcbae5cc25908c56bdabcf877) montre comment utiliser les structs avec les protocoles.

## Types opaques

Cette fonctionnalité semble complexe à comprendre, mais comme elle est très utilisée dans SwiftUI, nous allons en donner une explication brève et fournir quelques liens pour l'étudier plus en profondeur.

Les types opaques permettent de manipuler un protocole tout en gardant les informations du type concret connues par le compilateur.
Il est activé en préfixant le type avec le mot-clé `some`.

Les types opaques permettent de conserver les avantages de l'abstraction du code au niveau du développeur tout en conservant les avantages de performance et d'optimisation du typage concret.
En plus de cela, ils permettent au compilateur de mieux gérer certains cas où le complilateur a besoin de savoir le type concret derrière le protocole.
Veuillez noter qu'expliquer toutes les fonctionnalités que les types opaques apportent au code est un sujet avancé.
Pour plus d'informations et de détails, veuillez vous référer aux articles mentionnés en fin de page.

Pour cette formation, nous supposerons que les types opaques aident le compilateur à effectuer de meilleures optimisations avec les protocoles, sont utilisés à de nombreux endroits dans SwiftUI et permettent d'améliorer notre code dans certains cas.
Nous allons montrer ci-dessous un cas d'utilisation simple qui est rendu possible grâce aux types opaques.

```swift
// Source : https://www.educative.io/answers/what-is-opaque-type-in-swift

// Créez une fonction qui renvoie un Equatable.
// Le compilateur échoue si le type de retour est "Equatable".
func makeInteger() -> some Equatable{ 
  Int.random(in : 0...10)
} 

let firstInteger = makeInteger()
let secondInteger = makeInteger()

// ceci renvoie "false" parce qu'ils sont du même type concret sinon, le compilateur va échouer.
print(firstInteger == secondInteger)

func makeString() -> some Equatable{
  "Une Chaîne"
}
let firstString = makeString()

// Erreur de compilation car le type concret n'est pas le même.
print(premierInteger == premierString) 
```

Depuis Swift 5.1, les types opaques ne sont disponibles que [pour les valeurs de retour](https://github.com/apple/swift-evolution/blob/main/proposals/0244-opaque-result-types.md).
Depuis Swift 5.7 [les arguments opaques ont été implémentés](https://github.com/apple/swift-evolution/blob/main/proposals/0341-opaque-parameters.md).

## Utiliser les structs par défaut

Aussi surprenant que cela puisse paraître pour un développeur OOP (comme Java), Apple recommande d'utiliser [les structures par défaut au lieu des classes](https://developer.apple.com/documentation/swift/choosing-between-structures-and-classes).
Plus précisément, lorsque l'on souhaite ajouter un nouveau type de données, il ne faut pas partir du principe qu'il s'agira d'une classe mais plutôt vérifier si une structure est plus pertinente.
Apple fournit les recommandations suivantes :

- Utilisez les structures par défaut.
- Utilisez des classes lorsque vous avez besoin d'une interopérabilité avec Objective-C.
- Utilisez des classes lorsque vous devez contrôler l'identité des données que vous modélisez.
- Utilisez des structures avec des protocoles pour adopter un comportement en partageant des implémentations.

Nous notons que les structures sont le choix par défaut principalement parce qu'elles sont des types passés par valeur.
Cela rend le code plus prévisible car les changements ne peuvent pas provenir d'un appel parent.
Un autre avantage des structures est qu'elles sont plus compatibles avec la programmation fonctionnelle.
Nous parlerons de la programmation fonctionnelle dans la section suivante.

## Caractéristiques de la programmation fonctionnelle

La programmation fonctionnelle s'articule autour de [trois concepts principaux](https://flexiple.com/ios/introduction-to-functional-programming-using-swift/) : les fonctions pures, les variables immuables et la programmation déclarative.

Les fonctions pures sont des fonctions qui n'ont pas d'effets secondaires et qui renverront donc toujours la même sortie étant donné la même entrée.
Swift permet de créer des fonctions pures mais ne garantit pas à la compilation qu'une fonction est pure.

Les variables immuables peuvent être créés en utilisant des classes ou des structs avec des propriétés constantes (déclarées avec `let`).
Comme expliqué plus tôt, les structs sont recommandés par défaut [et voici d'autres bonnes raisons](https://stackoverflow.com/a/24232845).
L'une des plus importantes est que les structs sont transmis par valeur, ce qui permet d'éviter les effets secondaires.

La programmation déclarative peut être facilement expliquée comme une façon de programmer qui est centrée [sur le fait de dire quoi faire et non comment le faire](https://blog.ndepend.com/declarative-programming-depth/).
Cela permet d'obtenir un code plus clair et plus facile à maintenir que la programmation impérative traditionnelle.
Par exemple, lorsque nous voulons filtrer une table, une boucle for qui décrit ce qu'il faut faire à chaque itération n'est pas déclarative (on dit impérative dans ce cas) alors que la syntaxe SQL WHERE est considérée comme déclarative.
La programmation déclarative est possible en Swift grâce au chaînage de fonctions et au passage de fonctions en argument.
En effet, comme nous l'avons vu précédemment, Swift possède un support de 1ère classe pour les fonctions.
En plus de cela, nous pouvons trouver des API déclaratives dans Swift et SwiftUI.
Nous aurons l'occasion de constater le style déclaratif de SwiftUI dans un autre chapitre.
Pour l'instant, nous allons illustrer [avec cet extrait de code](https://swiftfiddle.com/4cebea7bfea3d58600df30f1af325663) comment traiter une liste de chaînes de caractères en utilisant uniquement les API déclaratives fournies par Swift.

Swift possède de nombreuses autres fonctionnalités et propose une bibliothèque standard riche.
Nous les explorerons au besoin dans les prochaines sections.
Pour l'instant, créons quelques interfaces utilisateur dans le prochain chapitre.

## Exercices

### Exercice 1

[Veuillez cliquer sur ce lien pour voir l'exercice](https://swiftfiddle.com/5d65286d3db0ccf08f7ca3bf1cef31fe)

::: details Veuillez ouvrir pour voir la/les solution(s)
[Solution](https://swiftfiddle.com/41469e54bc7c025b003341a0e96f16a3)
:::

### Exercice 2

[Veuillez cliquer sur ce lien pour voir l'exercice](https://swiftfiddle.com/43fc226645abb5457d26c7176fb6009d)

::: details Veuillez ouvrir pour voir la/les solution(s)
[Solution](https://swiftfiddle.com/a1227e17989ad80da5137a31aa6dfbeb)
:::

### Sources et autres lectures

- Documentation officielle de Swift](https://docs.swift.org).
- [Comprendre les types opaques dans Swift](https://tanaschita.com/20220206-understanding-opaque-types-in-swift/).
- [Swift evolution Opaque Result Types](https://github.com/apple/swift-evolution/blob/main/proposals/0244-opaque-result-types.md)