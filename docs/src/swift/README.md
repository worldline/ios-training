# Swift

Swift is the official programming language for developing iOS, iPadOS, macOS, watchOS and AppleTV apps. It can also target other platforms such as Windows, Linux and Android.

The source code of the language is hosted on [apple/swift](https://github.com/apple/swift) github repository.

## A quick tour of some features

Swift has modern and interesting features. Here some quick notable ones:

- Swift is statically typed and support implicit typing.
- `var` creates mutable variables.
- `let` creates immutable variables or constants depending on the type.
- String interpolation is available with this syntax `\(expression)`.
- Parenthesis are not necessary in `if`, `for`, `while` and `switch` statements
- for-each is the only type of for loop available
- Types are not nullable by default. More about null safety later.
- Functional programming features are supported such as Higher-order functions and functions as 1st class items.
- Object oriented programming is supported however, interfaces are called protocols.

The following code illustrates some of the features listed above.

<iframe width='100%' height="700px" src="https://www.jdoodle.com/embed/v0/3tZJ"></iframe>

In the following sections, we will delve into more features.

## Functions

In the following, we use the terms argument and parameter interchangeably.

The declaration of functions in swift has the following peculiarities:

- Parameters are named and ordered. This means that when you call a function, you must specify the name of the arguments in the correct order.
- A parameter can have different external and internal names by declaring it like this: `externalName internalName: Type`. The external name is also called an argument label.
- You can make an parameter anonymous by setting this external name: `_`.
- Arguments can have a default value. These are also called optional arguments.

The following code snippet illustrates the above features.

<iframe width='100%' height="700px" src="https://www.jdoodle.com/embed/v0/3v1n"></iframe>

Swift allows to use functions as first class items. This allows to store function references into variables, pass functions as arguments to other functions and return a function from a function. Here is a brief summary of the features related to using a function as a 1st class item:

- A function can be assigned to a variable, passed as a function parameter or returned from a function.
- A function type can be expressed as follows: `(typeOfParam1, typeOfParam2, etc) -> returnType`.
- The empty return type is Void.
- We can use `typealias` to shorten writing long types.
- Swift supports anonymous functions (also called lambda function) with the following syntax `{ argName1, argName2, etc. in // code }`

The following code snippet illustrates these features.

<iframe width='100%' height="700px" src="https://www.jdoodle.com/embed/v0/3v1y"></iframe>

## Null safety

## Object oriented programming features

## Sources
