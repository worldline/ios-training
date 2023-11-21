# Swift (part 1)

::: tip Estimated time
1/2 day
:::

Swift is the official programming language for developing iOS, iPadOS, macOS, watchOS and AppleTV apps.
It can also target other platforms such as Windows, Linux and Android.

The source code of the language is hosted on [apple/swift](https://github.com/apple/swift) GitHub repository.

## A quick tour of some features

Swift has modern and interesting features. Here are some notable ones:

- Swift is statically typed and supports implicit typing.
  - *Static* typing: types cannot change on runtime (it is the opposite of dynamic typing).
  - *Implicit* typing: the compiler can infer the type whenever possible.
- `var` creates mutable variables.
- `let` creates immutable variables or constants.
- String interpolation is available with this syntax `\(expression)`.
- Parenthesis are not required in `if`, `for`, `while` and `switch` statements.
- for-each is the only type of for loop available.
- *Optionals* allows to write code free from null pointer errors (also called Null Safety in other languages).
- Functional programming is supported (Higher-order functions and functions as 1st class items, etc.).
- Object oriented programming is supported.
- Interfaces are called protocols and they are used a lot.
- Structures are available and provide a lot of features (More on that later).

[this code](https://swiftfiddle.com/lupxhfuqjrdknpibphp6htt54a) illustrates some of the features listed above.

In the following sections, we will delve into more features.

::: tip ++ and -- are removed since swift 3
[This post](https://github.com/apple/swift-evolution/blob/master/proposals/0004-remove-pre-post-inc-decrement.md) details all the problems related to using these operators.
:::

## Functions

In the this section, the terms 'argument' and 'parameter' are used interchangeably.

The declaration of functions in Swift has the following peculiarities:

- Parameters are named and ordered. This means that when you call a function, you must specify the name of the arguments in the same order as the declaration.
- A parameter can have different external and internal names by declaring it like this: `externalName internalName: Type`. The external name is also called an argument label.
- You can make a parameter anonymous by setting this external name: `_`.
- Arguments can have a default value. These are also called optional arguments.

[This code](https://swiftfiddle.com/690a3e3bbe580f524f72358ccdb696da) illustrates the above features.

Swift allows to use functions as first class items or citizens.
This allows to store function references into variables, pass functions as arguments to other functions and return a function from a function.
Here is a brief listing of the these features:

- A function can be assigned to a variable, passed as a function parameter or returned from a function.
- A function type can be expressed as follows: `(typeOfParam1, typeOfParam2, etc) -> returnType`.
- The empty return type is `Void`.
- We can use `typealias` to shorten writing long types.
- Swift supports anonymous functions (also called lambda function) with the following syntax `{ argName1, argName2, etc. in // code }`

[This code](https://swiftfiddle.com/5d6b837c869bf23615376bc4cc70bcd1) illustrates these features.

Let's explore in the next section, one of the most amazing features of Swift which is *Optionals*.

## Optionals (aka. Null safety)

In a nutshell, optionals is a compiler feature that allows you to avoid the infamous *Null pointer exception* or *npe*.
The Swift compiler provides null safety and reports errors and warnings when we manipulate nullable (also called optional) values.
Here is a list of null safety features provided by swift:

::: tip The name of null in iOS development
In Swift, the null value is called `nil`
:::

- All types are non optional by default. This means that we cannot assign `nil` to a variable or an argument. For example, this code fails `var s: String = nil`.
- A type can be made optional by suffixing it with a *?*. For example: `var s: String? = nil`.
- You cannot call a method or a property of an optional type, unless you do one of those possibilities:
  - Use optional chaining with the *?* suffix.
  - Provide a default value with the *??* operator.
  - Unwrap the optional so that it becomes non optional.
  - Force unwrap the optional using the *!* suffix. This should never be used as it bypasses compiler checks.

::: danger Never unwrap with !
You must never force unwrap with the *!*.
Use other unwrapping techniques instead.
On of the rarest exceptions is with Interface builder's Outlets in UIKit `@IBOutlet var label: UILabel!`.
Fortunately, since we are not using UIKit in this training, we will avoid this situation.
:::

[This code](https://swiftfiddle.com/fa7ad8713475c04666462236db939857) illustrates null safety and how to use optional types.

## Enumerations

Enumerations allow to work with a group of values in a type-safe fashion. Swift provides many interesting features to enumerations:

- When the compiler can infer it, you can omit the name of the enumeration when you use one of its values.
- Switch statements support enumerations.
- You can easily iterate over an enum's values by using `: CaseIterable`.
- You can associate values or provide a raw value to enumeration cases. Raw values can be implicitly assigned.
- You can use another enumeration as associated value, this is called *recursive enumeration*.

[This code](https://swiftfiddle.com/d508deb3493e9b572eaf00891c91d8f0) illustrates some enumeration features. For further reading please consult [the official documentation](https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html).

## Exercises

### Exercise 1

[Please click on this link to view the exercise](https://swiftfiddle.com/6a40668c99d1e2cf079be7525548ca60)

::: details Please open to see the solution(s)
[Solution](https://swiftfiddle.com/4e97fc9476694424b0fbab6dd8118c35)
:::

### Exercise 2

[Please click on this link to view the exercise](https://swiftfiddle.com/0e980f44cf6855c63f3a9ce772872dde)

::: details Please open to see the solution(s)
[Solution](https://swiftfiddle.com/1bb9a747f719e0f35ca470c079a1e453)
:::

## Sources

- [Swift official documentation](https://docs.swift.org).
