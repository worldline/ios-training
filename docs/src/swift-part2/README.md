# Swift (part 2)

::: tip Estimated time
1/2 day
:::

## Object oriented programming features

Swift supports most _Object Oriented Programming_ features:

- Classes that can be instantiated into objects.
  - Constructors and destructors are called initializers and deinitializers respectively.
- Encapsulation and [4 access levels](https://docs.swift.org/swift-book/LanguageGuide/AccessControl.html) that range from private to public
- Simple inheritance of classes. Multiple inheritance of classes and is not supported.
- Inheritance allows one class to use the characteristics of another.
- Method overriding and [polymorphism](https://levelup.gitconnected.com/polymorphism-in-swift) and access control.
- Overloading of operators and functions, [composition](https://www.avanderlee.com/swift/composition-inheritance-code-architecture/).
- Static methods and properties are supported.
- Generic types are supported
- _Protocols_ which are the equivalent of _Interfaces_.
  - Classes and structs can conform to multiple protocols.
  - Protocols can have [associated types](https://www.hackingwithswift.com/articles/74/understanding-protocol-associated-types-and-their-constraints) which is similar to generic types.
  - They are used a lot by swift developers to the point that there is a programming technique called **Protocol oriented programming**.

Here are some additional features:

- Extensions allow to add functions and conform to additional protocols outside of the original class, struct or protocol declaration. This has many uses that simplify our code and here are some examples.
  - They can add methods to classes from any library that we can use.
  - They can define default implementations in protocols.
- Abstract classes are not available

[this code](https://swiftfiddle.com/05f4d4d3c8235299a875e08dcb3992f8) illustrates some of the above features.

In additions to classes, structs in swift are powerful and provide similar features than classes with some exceptions.

## Structs

In Swift, structs have many similar features with classes.
They support properties, methods, [subscripts](https://docs.swift.org/swift-book/LanguageGuide/Subscripts.html), initializers, extensions and conforming to protocols.
The features that are only available in classes [are as follows](https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html):

- Inheritance.
- Type casting (enables you to check and interpret the type of a class instance at runtime).
- Deinitializers.
- Reference counting allows more than one reference to a class instance (similar to pointers but much less complex to use).

[this code](https://swiftfiddle.com/d72ea73dcbae5cc25908c56bdabcf877) sample shows how to use structs with protocols.

## Opaque types

This feature seems advanced to understand but since it's used a lot in SwiftUI, let's explore a simple explanation and we'll provide some links to study it further.

In a base level, opaque types allow to return Protocols while keeping the concrete type information known by the compiler.
It is enabled by prefixing the type with the `some` keyword.

Opaque types allow to keep the benefits of abstracting the code on a developer level while maintaining the performance and optimization benefits of concrete typing.
In addition to that, they allow the compiler to better handle some cases such as Self or associated type requirements.
Please note that explaining all the features that opaque types bring to the code is an advanced topic.
For more information and details, please read the articles mentioned in the [Sources and more reading section](#sources-and-more-reading).

For this training, we'll assume that opaque help types the compiler perform better optimizations with protocols, are used in many places in SwiftUI and allow to improve our code in some cases.
We'll show below a simple use case where we can define a method that returns an `Equatable`.

```swift
// Source: https://www.educative.io/answers/what-is-opaque-type-in-swift

// create a function that returns some Equatable
// The compiler fails is the return type is just "Equatable"
func makeInteger() -> some Equatable{
  Int.random(in: 0...10)
}

let firstInteger = makeInteger()
let secondInteger = makeInteger()

// this returns "false" because they are of the same concrete type else, Xcode will scream at us.
print(firstInteger == secondInteger)

func makeString() -> some Equatable{
  "A String"
}
let firstString = makeString()

// Compiler error because the concrete type is not the same.
print(firstInteger == firstString)
```

As of Swift 5.1 [opaque types are only available for return values](https://github.com/apple/swift-evolution/blob/main/proposals/0244-opaque-result-types.md).
As of Swift 5.7 [opaque arguments have been implemented](https://github.com/apple/swift-evolution/blob/main/proposals/0341-opaque-parameters.md)

## Use structs by default

As surprising as it seems, Apple recommends using [structs by default instead of classes](https://developer.apple.com/documentation/swift/choosing-between-structures-and-classes).
More precisely, when we want to add a new data type, we should not assume that it should be a class by default and check if a structure is more relevant.
Apple provides the following recommendations:

- Use structures by default.
- Use classes when you need Objective-C interoperability.
- Use classes when you need to control the identity of the data you’re modeling.
- Use structures along with protocols to adopt behavior by sharing implementations.

We note that structures are the default choice mostly because they are value types.
This makes the code more predictable because changes cannot come from a parent call.
Another advantage of structs is that they are more friendly with functional programming.
We'll talk about functional programming in the next section.

## Functional programming features

Functional programming revolves around [three main concepts](https://flexiple.com/ios/introduction-to-functional-programming-using-swift/): pure functions, immutable objects and declarative programming.

Pure functions are functions that do not have side effects and will thus return always the same output given the same input.
Swift allows to create pure functions but does not provide compile time guarantees that a function is pure.

Immutable objects can be created using classes or structs with constant properties (declared with `let`).
As mentioned above, structs are recommended by default [and here are other good reasons](https://stackoverflow.com/a/24232845).
One of the most notable ones is that since structs are passed around by value, thus they help us avoiding side effects.

Declarative programming can be easily explained as a way of programming that is centered [around telling what to do and not how to do it](https://blog.ndepend.com/declarative-programming-depth/).
This allows to obtain a clearer and more maintainable code than traditional imperative programming.
For example, when we want to filter a table, a for loop is not declarative (we say imperative in this case) while the WHERE SQL syntax is considered declarative.
Declarative programing is possible in Swift through chaining functions and passing functions as arguments.
Indeed, as we have seen earlier, Swift has 1st class support for functions.
In addition to that, we can find declarative APIs in the standard Swift library and in Swift UI.
The latter will be explored in a different chapter.
For now, let's illustrate [with this code](https://swiftfiddle.com/4cebea7bfea3d58600df30f1af325663) how to process a list of strings using only declarative APIs provided by Swift.

Swift has many more features and provides a rich standard library.
We'll explore them as needed in the next sections.
For now, let's create some UIs in the next chapter.

## Structured Concurrency

- Swift supports writing concurrent code in a structured way.
- Concurrency means that we execute multiple **tasks** at the same time. For example, update the UI while the app performs an HTTP request to the server.
- In Swift, we can create concurrent Tasks with the `Task`, `TaskGroup` types.
- Without Structured concurrency, we would use complex concepts to such as callbacks which make code less readable (have you lived the [callback hell](https://swiftfiddle.com/ce6995e6f1cd9c0fb226df7995b546a5) ?).
- We say that a code is [structured](https://oleb.net/2021/structured-concurrency) when we use the well-know control flow structures :if/then/else, loops, functions, lexical scopes for variables.
  - Structured concurrency means that we write concurrent code using the usual control flow structures (as opposed to callback-based concurrent code)
  - In Swift is possible through the `async` and `await` keywords.
  - When we `await` a `Task`, the control flow will continue when it end without blocking the `Task` or `TaskGroup` on which it is launched.
  - A function that has uses the `await` keyword must be declared as `async`
- To summarize `async and await` + `Task` and `TaskGroup` = **Structured Concurrency**
- Continuations allow to convert callback code into async/await

This swift script shows a sample of using [Task + async/await](https://swiftfiddle.com/c34b73f3b260192f63bd8159b9853986)

This swift script shows a sample of using [TaskGoup + async/await](https://swiftfiddle.com/93183f842d0d02756b3e911e9ddc24b8)

This swift script shows a sample of [TaskGoup cancellation](https://swiftfiddle.com/d5c9039422d60ce14f307623a3d9107e)

This swift script shows how to [convert callbacks into async/await](https://swiftfiddle.com/d62a161afcd623615a27fb09a8b2dc5c)

::: tip Structured Concurrency in Playground Book

```swift
// Reference: https://stackoverflow.com/a/24066317
import PlaygroundSupport

//Playground does not stop at the end of the code
PlaygroundPage.current.needsIndefiniteExecution = true

func sampleFunc() async {
  print("sampleFunc")
  try? await Task.sleep(until: .now + .seconds(2))
}

Task {
    await sampleFunc()
    print("done")
    // End the playground
    PlaygroundPage.current.finishExecution()
}
```

:::

## Generics

- Generics allow to pass a type as a parameter to a class, struct, enum or function.
- A type parameter can be declares with `<T>` where `T` is the type parameter.
- Examples
  - `func printArray<T>(array: [T]) { for item in array { print(item) } }`
  -
- Swift can infer the type of the parameter if it is not provided and if it's not ambiguous.

[this code](https://swiftfiddle.com/c2619f36b41875606075e1f4baf2b93a) illustrates some of the above features.

## Key-paths

- [Key-paths](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/expressions/#Key-Path-Expression) allow to refer to properties of a type.
- They are created with the `\.propertyName` syntax.
- They are often used to sort, filter, group and map collections and in SwiftUI to bind properties to UI elements.

[this code](https://swiftfiddle.com/9a220108db372f3c2063d4d7275001a9) illustrates some of the above features.

## Exercises

### Exercise 1

[Please click on this link to view the exercise](https://swiftfiddle.com/5d65286d3db0ccf08f7ca3bf1cef31fe)

::: details Please open to see the solution(s)
[Solution](https://swiftfiddle.com/41469e54bc7c025b003341a0e96f16a3)
:::

### Exercise 2

[Please click on this link to view the exercise](https://swiftfiddle.com/nujjokdzhrbo7gdcaxmqlwzdqi)

::: details Please open to see the solution(s)
[Solution](https://swiftfiddle.com/a1227e17989ad80da5137a31aa6dfbeb)
:::

### Exercise 3

[Please click on this link to view the exercise](https://swiftfiddle.com/oyn7ii7dvne37h5uqiqoti5xou)

::: details Please open to see the solution(s)
[Solution](https://swiftfiddle.com/7fsyuiu5fzdwtj2dhenxx3x5xm)
:::

### Exercise 4 (legacy)

[Please click on this link to view the exercise](https://swiftfiddle.com/d225e7e3b061035b6a1987c3cf2fb3d5)

::: details Please open to see the solution(s)
[Solution](https://swiftfiddle.com/b45e785e8d832058e394f179782b214c)

[Solution 2 with results](https://swiftfiddle.com/6aac1fb721c00c565509dded883f7481)
:::

## Sources and more reading

- [Swift official documentation](https://docs.swift.org).
- [Understanding opaque types in Swift](https://tanaschita.com/20220206-understanding-opaque-types-in-swift/)
- [Swift evolution Opaque Result Types](https://github.com/apple/swift-evolution/blob/main/proposals/0244-opaque-result-types.md)
- [Some async examples on SwiftFiddle](https://async-await-in-swift.netlify.app/) and [how to use Runloop on SwiftFiddle](https://github.com/SwiftFiddle/swiftfiddle-web/discussions/101)
