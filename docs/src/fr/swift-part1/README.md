# Swift (partie 1)

::: tip Temps estimé
1/2 journée
:::

Swift est le langage de programmation officiel pour le développement d'applications iOS, iPadOS, macOS, watchOS et AppleTV.
Il peut également cibler d'autres plateformes telles que Windows, Linux et Android.

Le code source du langage est hébergé sur le dépôt GitHub [apple/swift](https://github.com/apple/swift).

## Un tour rapide de quelques fonctionnalités

Swift possède des fonctionnalités modernes et intéressantes.
En voici quelques-unes :

- Swift est typée statiquement et supporte le typage implicite.
  - Typage statique : les types ne peuvent pas changer pendant l'exécution (c'est l'opposé du typage dynamique).
  - Typage implicite : le compilateur peut déduire le type lorsque cela est possible.
- `var` crée des variables mutables.
- `let` crée des variables immuables ou des constantes.
- L'interpolation de chaînes de caractères est disponible avec la syntaxe `\(expression)`.
- Les parenthèses ne sont pas nécessaires dans les instructions `if`, `for`, `while` et `switch`.
- for-each est le seul type de boucle for disponible.
- *Les optionnels* (également appelé Null Safety dans d'autres langages) permettent d'écrire du code exempt d'erreurs de pointeur nul (alias, les fameux NullPointerException).
- La programmation fonctionnelle est supportée (fonctions d'ordre supérieur et fonctions comme éléments de 1ère classe, etc.)
- La programmation orientée objet est supportée.
- Les interfaces sont appelées protocoles et sont très utilisées.
- Les structures sont disponibles et offrent de nombreuses fonctionnalités (nous y reviendrons plus tard).

[Cet extrait de code](https://swiftfiddle.com/2382a3b3fdc54631140f51bae116dc74) illustre certaines des caractéristiques énumérées ci-dessus.

Dans les sections suivantes, nous allons approfondir d'autres fonctionnalités.

::: les opérateurs ++ et -- sont supprimés depuis swift 3
[Ce post](https://github.com/apple/swift-evolution/blob/master/proposals/0004-remove-pre-post-inc-decrement.md) détaille tous les problèmes liés à l'utilisation de ces opérateurs.
:::

## Fonctions

Dans cette section, les termes "argument" et "paramètre" sont utilisés de manière interchangeable.

La déclaration des fonctions en Swift présente les particularités suivantes :

- Les paramètres sont nommés et ordonnés. Cela signifie que lorsque vous appelez une fonction, vous devez spécifier le nom des arguments dans le même ordre que la déclaration.
- Un paramètre peut avoir des noms externes et internes différents en le déclarant comme suit : `Nom_Externe Nom_Interne : Type`. Le nom externe est également appelé libellé.
- Vous pouvez rendre un paramètre anonyme en définissant `_` comme nom externe.
- Les arguments peuvent avoir une valeur par défaut. Ils sont également appelés arguments optionnels.

[Ce code](https://swiftfiddle.com/690a3e3bbe580f524f72358ccdb696da) illustre les caractéristiques ci-dessus.

Swift permet d'utiliser les fonctions comme des éléments ou des citoyens de première classe.
Cela permet de stocker des références de fonctions dans des variables, de passer des fonctions comme arguments à d'autres fonctions et de retourner une fonction à partir d'une fonction.
Voici un récapitulatif des caractéristiques liées à l'usage des fonctions comme des éléments de première classe:

- Une fonction peut être affectée à une variable, passée en tant que paramètre de fonction ou retournée à partir d'une fonction.
- Un type de fonction peut être exprimé comme suit : `(typeOfParam1, typeOfParam2, etc) -> returnType`.
- Le type de retour vide est `Void`.
- On peut utiliser des `typealias` pour raccourcir l'écriture des types longs.
- Swift prend en charge les fonctions anonymes (également appelées fonctions lambda) avec la syntaxe suivante `{ argName1, argName2, etc. dans // le code }`

[Ce code](https://swiftfiddle.com/5d6b837c869bf23615376bc4cc70bcd1) illustre ces fonctionnalités.

Dans la section suivante, nous allons explorer l'une des fonctions les plus étonnantes de Swift, à savoir les *Optionnels*.

## Optionals (alias Null safety)

En un mot, les optionnels sont une fonctionnalité du compilateur qui vous permet d'éviter la tristement célèbre *Null pointer exception* ou *npe*.
Le compilateur Swift assure la protection contre la manipulation de références nulles et remonte des erreurs et avertissements lorsque s'il y a le moindre risque de npe.
Voici une liste des fonctionnalités de "Null safety" proposées par Swift :

::: tip Le nom de null dans l'univers iOS
En Swift, la valeur nulle est appelée `nil`.
:::

- Tous les types sont non optionnels par défaut. Cela signifie que nous ne pouvons pas assigner `nil` à une variable ou à un argument. Par exemple, ce code échoue `var s : String = nil`.
- Un type peut être rendu optionnel en le suffixant avec un *?*. Par exemple : `var s : String? = nil`.
- Vous ne pouvez pas appeler une méthode ou une propriété d'un type optionnel, sauf si vous faites l'une de ces possibilités :
  - Utiliser le chaînage optionnel avec le suffixe *?*.
  - Fournir une valeur par défaut avec l'opérateur *??*.
  - Déballer l'optionnel pour qu'il devienne non optionnel.
  - Forcer le déballage de l'optionnel en utilisant le suffixe *!*. Cette méthode ne devrait jamais être utilisée car elle contourne les contrôles du compilateur.

::: danger Ne jamais déballer avec !
Vous ne devez jamais forcer le déballage avec le suffixe *!*. 
Utilisez plutôt d'autres techniques de déballage.
L'une des exceptions les plus rares concerne les IBOutlet d'Interface Builder `@IBOutlet var label : UILabel!`.
Heureusement, ce cas concerne UIKit, nous éviterons cette situation dans la formation car nous seons sur du SwiftUI.
:::

[Ce code](https://swiftfiddle.com/fa7ad8713475c04666462236db939857) illustre les optionnels.

## Enumérations

Les énumérations permettent de travailler avec un groupe de valeurs de manière sûre. Swift fournit de nombreuses fonctionnalités intéressantes aux énumérations :

- Lorsque le compilateur peut le déduire, vous pouvez omettre le nom de l'énumération lorsque vous utilisez une de ses valeurs.
- Les instructions Switch supportent les énumérations.
- Vous pouvez facilement itérer sur les valeurs d'une énumération en utilisant ` : CaseIterable`.
- Vous pouvez associer des valeurs ou fournir une valeur brute aux cas d'énumération. Les valeurs brutes peuvent être implicitement assignées.
- Vous pouvez utiliser une autre énumération comme valeur associée, ceci est appelé *énumération récursive*.

[Ce code](https://swiftfiddle.com/d508deb3493e9b572eaf00891c91d8f0) illustre certaines caractéristiques des énumérations. Pour plus d'informations, veuillez consulter [la documentation officielle](https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html).

## Exercices

### Exercice 1

[Veuillez cliquer sur ce lien pour visualiser l'exercice](https://swiftfiddle.com/6a40668c99d1e2cf079be7525548ca60)

::: details Veuillez ouvrir pour voir la/les solution(s)
[Solution](https://swiftfiddle.com/4e97fc9476694424b0fbab6dd8118c35)
:::

### Exercice 2

[Veuillez cliquer sur ce lien pour voir l'exercice](https://swiftfiddle.com/0e980f44cf6855c63f3a9ce772872dde)

::: details Veuillez ouvrir pour voir la/les solution(s)
[Solution](https://swiftfiddle.com/1bb9a747f719e0f35ca470c079a1e453)
:::

## Sources

- [Documentation officielle de Swift](https://docs.swift.org).