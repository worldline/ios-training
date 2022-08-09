# Swift (part 2)

## Object oriented programming features

Swift supports most Object oriented features: classes, instances, encapsulation, simple inheritance, overriding, overloading, compositions, polymorphism and access control.
There are some differences and additional features that are highlighted below:

- Multiple inheritance of classes and abstract classes are not supported. 
- *Interfaces* are named *protocols* and they are used a lot by swift developers to the point that there is a programming technique called **Protocol oriented programming**.
- Extensions allow to add functions and conform to additional protocols outside of the original class declaration.
This has many uses.
For example, we can add methods to the standard String class.

<iframe width='100%' height="700px" src="https://www.jdoodle.com/embed/v0/41uW"></iframe>

In additions to classes, structs in swift are very powerful and provide similar features than classes with some exceptions.

## Structs

In Swift, structs have similar features than classes.
They support properties, methods, [subscripts](https://docs.swift.org/swift-book/LanguageGuide/Subscripts.html), initializers, extensions and conforming to protocols.
The features that are only available in classes [are as follows](https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html):

- Inheritance enables one class to inherit the characteristics of another.
- Type casting enables you to check and interpret the type of a class instance at runtime.
- Deinitializers enable an instance of a class to free up any resources it has assigned.
- Reference counting allows more than one reference to a class instance.

The following code sample shows how to use structs with protocols

<iframe width='100%' height="700px" src="https://www.jdoodle.com/embed/v0/51id"></iframe>

## Opaque types

This feature seems advanced to understand but since it's used a lot in SwiftUI, let's explore a simple explanation and we'll provide some links to study it further.

In a base level, opaque types allow to return Protocols while keeping the concrete type information known by the compiler.
It is enabled by prefixing the type with `some` keyword.

This allows to keep the benefits of abstracting the code on a developer level while maintaining the performance and optimization benefits of concrete typing.
In addition to that, it allows the compiler to better handle some cases such as Self or associated type requirements.
Please note that explaining all the features that opaque types bring to the code is an advanced topic.
For more information and details, please read the articles mentioned in the [Sources and more reading section](#sources-and-more-reading).

For this training, we'll assume that opaque help the compiler perform better optimizations with protocols and is used a lot in SwiftUI.
In addition to that, we'll show below a simple use case where we can see a concrete benefit of opaque types.

```swift
// https://www.educative.io/answers/what-is-opaque-type-in-swift

// create a function that returns some Equatable
func makeInteger() -> some Equatable{ 
  Int.random(in: 0...10)
} 

let firstInteger = makeInteger()
let secondInteger = makeInteger()

// comparing the firstInteger and secondInteger return type
//  this returns a result "false" because they are of the same return type else, Xcode will scream at us.
print(firstInteger == secondInteger) 
```


As of Swift 5.1 [opaque types are only available for return values](https://github.com/apple/swift-evolution/blob/main/proposals/0244-opaque-result-types.md).
As of Swift 5.7 [opaque arguments have been implemented](https://github.com/apple/swift-evolution/blob/main/proposals/0341-opaque-parameters.md)

## Use structs by default

As surprising as it seems, Apple recommends using [structs by default instead of classes](https://developer.apple.com/documentation/swift/choosing-between-structures-and-classes).
More precisely, when we want to add a new data type, we should not assume that it should be a class and check if a structure is more relevant.
Apple provides the following recommendations:

- Use structures by default.
- Use classes when you need Objective-C interoperability.
- Use classes when you need to control the identity of the data you’re modeling.
- Use structures along with protocols to adopt behavior by sharing implementations.

We note that structures are the default choice mostly because they value types.
This makes the code more predictable because changes cannot come somewhere from a parent call.
Another advantage of structs is that they are more friendly with functional programming.
We'll talk about functional programming in the next section.

## Functional programming features

Functional programming revolves around [three main concepts](https://flexiple.com/ios/introduction-to-functional-programming-using-swift/): pure functions, immutable objects and declarative programming.

Pure functions are functions that do not have side effects and will thus return always the same output given the same input.
Swift allows to create pure functions but does not provide compile time guarantees that a function is pure.

Immutable objects can be created using classes with constant properties (declared with `let`).
Another common practice is to use structs for [many good reasons](https://stackoverflow.com/a/24232845).
One of the most notable ones is that structs are passed around by value and thus are more relevant in the functional paradigm where we want to avoid side effects.

Declarative programming can be easily explained as a way of programming that is centered [around telling what to do and not how to do it](https://blog.ndepend.com/declarative-programming-depth/).
This allows to obtain a clear and more maintainable code.
For example, when we want to filter a table, a for loop is not declarative (we say imperative in this case) while the SQL syntax is considered declarative.
Declarative programing is possible in Swift through chaining functions and passing functions as arguments.
Indeed, we have seen earlier, Swift has 1st class support for functions.
In addition to that, we can find declarative APIs in the standard Swift library and in Swift UI.
The latter will be explored in a different chapter.
For now, let's illustrate this part by processing a list of strings using only declarative APIs provided by Swift and no for loops.

<iframe width='100%' height="700px" src="https://www.jdoodle.com/embed/v0/42L8"></iframe>

Swift has many more features and provides a rich standard library.
We'll explore them as needed in the next sections.
For now, let's create some UIs in the next chapter.

## Exercises

### Exercise 1

<iframe width='100%' height="700px" src=""></iframe>

Please open the details pane to see the solution(s)

::: details
<iframe width='100%' height="700px" src=""></iframe>
:::

### Exercise 2

<iframe width='100%' height="700px" src=""></iframe>

Please open the details pane to see the solution(s)

::: details
<iframe width='100%' height="700px" src=""></iframe>
:::

## Sources and more reading

- [Swift official documentation](https://docs.swift.org).
- [Understanding opaque types in Swift](https://tanaschita.com/20220206-understanding-opaque-types-in-swift/)
- [Swift evolution Opaque Result Types](https://github.com/apple/swift-evolution/blob/main/proposals/0244-opaque-result-types.md)